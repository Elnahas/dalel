import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/on_boarding/views/on_boarding_view.dart';
import 'package:dalel/features/splash/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => SplashView(),
  ),
  GoRoute(
    path: "/onBoarding",
    builder: (context, state) => OnBoardingView(),
  ),
  GoRoute(
    path: "/signUp",
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: SignUpView(),
    ),
  ),
  GoRoute(
    path: "/signIn",
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: SignInView(),
    ),
  )
]);
