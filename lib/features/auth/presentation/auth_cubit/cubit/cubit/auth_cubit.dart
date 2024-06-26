import 'dart:ffi';


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:dalel/features/auth/presentation/auth_cubit/cubit/cubit/auth_state.dart';


import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/widgets.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


class AuthCubit extends Cubit<AuthState> {

  AuthCubit() : super(AuthInitial());


  String? firstName;


  String? lastName;


  String? emailAddress;


  String? password;


  GlobalKey<FormState> signupFormKye = GlobalKey();


  GlobalKey<FormState> signinFormKye = GlobalKey(); //Must be unice


  GlobalKey<FormState> forgotPasswordFormKye = GlobalKey(); //Must be unice


  bool? termsAndConditionCheckBoxValue = false;


  bool? obscurePasswordTextValue = true;


  Future<void> createUserWithEmailAndPassword() async {

    try {

      emit(SignupLoadingState());


      await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: emailAddress!,

        password: password!,

      );

      await addUserProfile();

      await verifyEmail();



      emit(SignupSuccessState());

    } on FirebaseAuthException catch (e) {

      _signUpHandelException(e);

    } catch (e) {

      emit(SignupFailureState(errMessage: e.toString()));

    }

  }

  void _signUpHandelException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
    
      emit(SignupFailureState(
    
          errMessage: "The password provided is too weak."));
    
    } else if (e.code == 'email-already-in-use') {
    
      emit(SignupFailureState(
    
          errMessage: "The account already exists for that email."));
    
    } else {
    
      emit(SignupFailureState(errMessage: e.message.toString()));
    
    }
  }


 Future<void> verifyEmail() async {

    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

  }


 void updateTermsAndConditionCheckBox({required newValue}) {

    termsAndConditionCheckBoxValue = newValue;


    emit(TermsAndConditionUpdateState());

  }


  void obscurePasswordText() {

    obscurePasswordTextValue = !obscurePasswordTextValue!;


    emit(ObscurePasswordUpdateState());

  }


  Future<void> signInWithEmailAndPassword() async {

    try {

      emit(SignInLoadingState());


      await FirebaseAuth.instance.signInWithEmailAndPassword(

          email: emailAddress!, password: password!);


      emit(SignInSuccessState());

    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {

        emit(SignInFailureState(errMessage: "No user found for that email."));

      } else if (e.code == 'wrong-password') {

        emit(SignInFailureState(

            errMessage: "Wrong password provided for that user."));

      } else {

        emit(SignInFailureState(errMessage: e.message.toString()));

      }

    } catch (e) {

      emit(SignInFailureState(errMessage: e.toString()));

    }

  }


  Future<void> resetPasswordWithLink() async {

    try {

      emit(ResetPasswordLoadingState());


      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);


      emit(ResetPasswordSuccessState());

    } catch (e) {

      emit(ResetPasswordFailureState(errMessage: e.toString()));

    }

  }


  Future<void> addUserProfile() async {

    CollectionReference users = FirebaseFirestore.instance.collection("users");


    await users.add({

      "email": emailAddress,

      "first_name": firstName,

      "last_name": lastName

    });

  }

}

