import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/core/const/icons/app_icons.dart';
import 'package:quiz_app/src/core/const/images/app_images.dart';
import 'package:quiz_app/src/features/auth/cubit/auth_cubit.dart';
import 'package:quiz_app/src/features/auth/widgets/auth_login_button.dart';
import 'package:quiz_app/src/features/auth/widgets/auth_navbar.dart';
import 'package:quiz_app/src/features/auth/widgets/divider.dart';
import 'package:toastification/toastification.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadedState) {
            Navigator.pushNamed(context, '/home');
            // ! oddiy test uchun
          } else if (state is AuthErrorState) {
            toastification.show(
              type: ToastificationType.error,
              title: Text(state.errorText),
            );
          } else if (state is AuthCanceledState) {
            print('bekor qilindi');
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.blue.withAlpha(50),
                        ),
                        child: Icon(
                          Icons.terminal,
                          size: 45,
                          color: AppColors.blue.withAlpha(200),
                        ),
                      ),
                      Positioned(
                        right: -10,
                        top: -10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(AppIcons.logo),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 72),
                  Text(
                    'DevPuzzle',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Solve. Code. Connect.',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 48),
                  AuthLoginButton(
                    text: 'Continue with Google',
                    icon: Image.asset(AppImages.google),
                    color: AppColors.congrey,
                    onTap: () async {
                      await context.read<AuthCubit>().signInWithGoogle();
                    },
                  ),
                  const SizedBox(height: 16),
                  AuthLoginButton(
                    text: 'Continue with Email',
                    icon: Icon(
                      Icons.email_outlined,
                      color: AppColors.white,
                      size: 24,
                    ),
                    color: AppColors.blue,
                    onTap: () {
                      // bor accountga kirish
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomDivider(text: 'OR'),
                  const SizedBox(height: 32),
                  AuthLoginButton(
                    text: 'Sign in with GitHub',
                    icon: Icon(
                      Icons.terminal,
                      size: 24,
                      color: AppColors.white,
                    ),
                    color: AppColors.mirage,
                    onTap: () {},
                  ),
                  const SizedBox(height: 32),
                  AuthNavbarWidget(
                    labelText: 'Don\'t have an account?',
                    navText: 'Sign up',
                    recongizer: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'BY CONTINUING, YOU AGREE TO OUR',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.grey,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'TERMS OF SERVICE',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: AppColors.grey,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.grey,
                      ),
                      children: [
                        TextSpan(text: '  &  '),
                        TextSpan(text: 'PRIVACY POLICY'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 128,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: AppColors.congrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
