import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisited == true) {
      FirebaseAuth.instance.currentUser == null ?
      delayedNavigate(context , "/signUp")
      :delayedNavigate(context , "/home");
    } else {
      delayedNavigate(context , "/onBoarding");
    }
    
    super.initState();
  }

  void delayedNavigate(context , path) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        customReplacementNavigate(context, path);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        AppStrings.appName,
        style: CustomTextStyles.pacifico400style64,
      )),
    );
  }
}
