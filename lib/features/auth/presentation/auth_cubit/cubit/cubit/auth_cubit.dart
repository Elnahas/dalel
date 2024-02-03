import 'dart:ffi';


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

  bool? termsAndConditionCheckBoxValue = false ;


  createUserWithEmailAndPassword() async {

    try {

      emit(SignupLoadingState());


      await FirebaseAuth.instance.createUserWithEmailAndPassword(

        email: emailAddress!,

        password: password!,

      );


      emit(SignupSuccessState());

    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {

        emit(SignupFailureState(

            errMessage: "The password provided is too weak."));

      } else if (e.code == 'email-already-in-use') {

        emit(SignupFailureState(

            errMessage: "The account already exists for that email."));

      }

    } catch (e) {

      emit(SignupFailureState(errMessage: e.toString()));

    }

  }

  updateTermsAndConditionCheckBox({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

}

