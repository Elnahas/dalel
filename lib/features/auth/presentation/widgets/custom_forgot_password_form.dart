import 'package:dalel/core/functions/custome_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is ResetPasswordSuccessState){
          showToast("Check Your Email To Reset Your Password");
          customReplacementNavigate(context, "/signIn");
        }
        else if(state is ResetPasswordFailureState){
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: authCubit.forgotPasswordFormKye,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                const SizedBox(height: 129),
                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomBtn(
                        text: AppStrings.sendResetPasswordLink,
                        onPressed: () async{
                          if(authCubit.forgotPasswordFormKye.currentState!.validate()){
                        await  authCubit.resetPasswordWithLink();

                          }
                        })
              ],
            ),
          ),
        );
      },
    );
  }
}
