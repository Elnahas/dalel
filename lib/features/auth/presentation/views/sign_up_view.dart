import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_signup_form.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 152),
            ),
            SliverToBoxAdapter(
              child: WelcomeTextWidget(text: AppStrings.welcome),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
                onTap: () {
                  customReplacementNavigate(context, "/signIn");
                },
              ),
            ),
                 SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
