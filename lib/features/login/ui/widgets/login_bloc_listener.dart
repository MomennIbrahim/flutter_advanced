import 'package:advanced_app/core/helpers/extension.dart';
import 'package:advanced_app/core/routing/routes.dart';
import 'package:advanced_app/core/theming/colors.dart';
import 'package:advanced_app/core/theming/styles.dart';
import 'package:advanced_app/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManger.mainBlue,
                      ),
                    ));
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        content: Text(
          error,
          style: Styles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Ok',
                style: Styles.font14DarkBlueSemiBold,
              ))
        ],
      ),
    );
  }
}
