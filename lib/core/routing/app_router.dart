import 'package:advanced_app/core/di/dependency_injection.dart';
import 'package:advanced_app/core/routing/routes.dart';
import 'package:advanced_app/features/home/ui/home_screen.dart';
import 'package:advanced_app/features/login/data/repos/login_repo.dart';
import 'package:advanced_app/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_app/features/login/ui/login_screen.dart';
import 'package:advanced_app/features/onboarding/onboarding_screen.dart';
import 'package:advanced_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:advanced_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:advanced_app/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(getIt<LoginRepo>()),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignUpCubit(getIt<SignUpRepo>()),
                  child: const SignUpScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text("No route defined ${settings.name}"),
                  ),
                ));
    }
  }
}
