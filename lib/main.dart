import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/core/router/app_router.dart';
import 'package:quiz_app/src/features/auth/cubit/auth_cubit.dart';
import 'package:quiz_app/src/features/auth/cubit/password_cubit.dart';
import 'package:quiz_app/src/features/auth/screens/sign_up.dart';
import 'package:quiz_app/src/features/home/screens/home_screen.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => PasswordCubit()),
      ],
      child: QuizApp(),
    ),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        return ToastificationWrapper(
          child: MaterialApp(
            onGenerateRoute: AppRouter.onGenarate,
            home: snap.hasData ? HomeScreen() : SignUpScreen(),
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.primary,
              colorScheme: ColorScheme.dark(primary: AppColors.blue),
            ),
          ),
        );
      },
    );
  }
}
