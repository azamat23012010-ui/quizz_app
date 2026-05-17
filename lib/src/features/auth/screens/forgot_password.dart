import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/features/auth/cubit/auth_cubit.dart';
import 'package:quiz_app/src/features/auth/widgets/auth_button.dart';
import 'package:quiz_app/src/features/auth/widgets/input_widget.dart';
import 'package:toastification/toastification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadedState) {
            toastification.show(
              title: Text('Password reset email yuborildi'),
              type: ToastificationType.success,
            );
            Navigator.pop(context);
          } else if (state is AuthErrorState) {
            toastification.show(
              title: Text(state.errorText),
              type: ToastificationType.error,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 200),
                Text(
                  'Forgot Password',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.white,
                  ),
                ),
                InputWidget(
                  label: 'Email',
                  hinttext: 'Enter email',
                  icon: Icon(Icons.email_outlined),
                  controller: emailController,
                ),
                SizedBox(height: 40),
                AuthButton(
                  text: 'Log in',
                  ontap: () {
                    if (emailController.text.isNotEmpty) {
                      context.read<AuthCubit>().forgotPassword(
                        email: emailController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
