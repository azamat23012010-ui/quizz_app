import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/core/const/icons/app_icons.dart';
import 'package:quiz_app/src/features/auth/cubit/auth_cubit.dart';
import 'package:quiz_app/src/features/auth/cubit/password_cubit.dart';
import 'package:quiz_app/src/features/auth/cubit/password_state.dart';
import 'package:quiz_app/src/features/auth/widgets/auth_button.dart';
import 'package:quiz_app/src/features/auth/widgets/input_widget.dart';
import 'package:quiz_app/src/features/auth/widgets/sign_buttom.dart';
import 'package:quiz_app/src/features/home/screens/home_screen.dart';
import 'package:toastification/toastification.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, size: 22, color: AppColors.white),
        ),
        centerTitle: true,
        title: SizedBox(
          width: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.logo, width: 32, height: 32),
              SizedBox(width: 4),
              Text(
                'DevPuzzle',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadedState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
            // ! oddiy test uchun
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            toastification.show(
              type: ToastificationType.error,
              title: Text(state.errorText),
            );
          } else if (state is AuthLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Loading...'),
                duration: Duration(days: 1),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 8),
              Text(
                'Join the Circuit',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Connect with developers solving the world\'s toughest technical puzzles.',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 40),
              InputWidget(
                controller: nameController,
                label: 'Full Name',
                hinttext: 'e.g., Ada Lovelace',
                icon: Icon(Icons.person_outline, color: AppColors.grey),
              ),
              SizedBox(height: 24),
              InputWidget(
                controller: emailController,
                label: 'Email Address',
                hinttext: 'developer@email.com',
                icon: Icon(Icons.alternate_email, color: AppColors.grey),
              ),
              SizedBox(height: 24),
              InputWidget(
                controller: passwordController,
                label: 'Password',
                hinttext: '••••••••',
                icon: Icon(Icons.lock_outline, color: AppColors.grey),
                isPassword: true,
                onchanged: (v) {
                  context.read<PasswordCubit>().checkPassword(v);
                },
              ),
              SizedBox(height: 5),
              BlocBuilder<PasswordCubit, PasswordState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          height: 4,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: AppColors.mirage,
                          ),
                          child: Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width:
                                  MediaQuery.sizeOf(context).width *
                                  state.strength,
                              decoration: BoxDecoration(
                                color: state.color,
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 3,
                        child: Text(
                          state.message,
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 40),
              AuthButton(
                text: 'Sign Up',
                ontap: () {
                  context.read<AuthCubit>().signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              SizedBox(height: 24),
              Text(
                'OR CONTINUE WITH',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SignInWidget(
                      image: AppIcons.github,
                      label: 'GitHub',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SignInWidget(image: AppIcons.stack, label: 'Stack'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
