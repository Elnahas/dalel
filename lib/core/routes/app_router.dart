import 'package:dalel/features/on_boarding/views/on_boarding_view.dart';
import 'package:dalel/features/splash/views/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => SplashView(),
  ),

  GoRoute(path: "/onBoarding",
  builder: (context, state) => OnBoardingView(),)
]);
