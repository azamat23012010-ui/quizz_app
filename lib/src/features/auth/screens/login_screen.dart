import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/features/auth/cubit/auth_cubit.dart';
import 'package:quiz_app/src/features/auth/widgets/auth_button.dart';
import 'package:quiz_app/src/features/auth/widgets/input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Center(
                child: Text(
                  'Log in',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              InputWidget(
                label: 'Email',
                hinttext: 'Enter email',
                icon: Icon(Icons.email_outlined),
                controller: emailController,
              ),
              SizedBox(height: 20),
              InputWidget(
                label: 'Password',
                hinttext: 'Password',
                icon: Icon(Icons.lock_outline),
                controller: passwordController,
                isPassword: true,
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.blue,
                  ),
                ),
              ),
              SizedBox(height: 40),
              AuthButton(
                text: 'Log in',
                ontap: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    context.read<AuthCubit>().logIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
