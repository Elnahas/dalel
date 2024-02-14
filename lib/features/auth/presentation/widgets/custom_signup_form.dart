import 'package:dalel/core/functions/custome_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showToast("Successfully , Check your email to verify your account");
          customReplacementNavigate(context, "/signIn");
        } else if (state is SignupFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.signupFormKye,
          child: Column(children: [
            CustomTextFormField(
              labelText: AppStrings.firstName,
              onChanged: (firstName) {
                authCubit.firstName = firstName;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.lastName,
              onChanged: (lastName) {
                authCubit.lastName = lastName;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.emailAddress,
              onChanged: (emailAddress) {
                authCubit.emailAddress = emailAddress;
              },
            ),
            CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
                obscureText: authCubit.obscurePasswordTextValue,
                suffixIcon: IconButton(
                  icon: Icon(authCubit.obscurePasswordTextValue == true
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                )),
            const TermsAndConditionWidget(),
            const SizedBox(
              height: 88,
            ),
            state is SignupLoadingState
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : CustomBtn(
                    text: AppStrings.signUp,
                    onPressed: authCubit.termsAndConditionCheckBoxValue!
                        ? () async {
                            if (authCubit.signupFormKye.currentState!
                                .validate()) {
                              await authCubit.createUserWithEmailAndPassword();
                            }
                          }
                        : null,
                  )
          ]),
        );
      },
    );
  }
}
