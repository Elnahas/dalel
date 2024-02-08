import 'package:dalel/core/functions/navigation.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              customReplacementNavigate(context, "/signUp");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text("Login")),
    );
  }
}