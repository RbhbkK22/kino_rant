import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/presentation/features/auth/bloc/auth_cubit.dart';
import 'package:kino_rant/presentation/features/auth/widgets/auth_button.dart';
import 'package:kino_rant/presentation/features/auth/widgets/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  EmailTextField(controller: emailController),
                  SizedBox(height: 10),
                  PasswordTextField(controller: passwordController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  AuthButton(
                    text: "Sing In",
                    onPressed: () {
                      context.read<AuthCubit>().login(emailController.text, passwordController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(bottom: 30),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  "Don’t you have an account? ",
                  style: TextStyle(color: Color(0xFF979797)),
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/register');
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
