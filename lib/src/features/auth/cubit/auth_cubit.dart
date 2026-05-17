import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/src/features/auth/cubit/google_sign.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signInWithGoogle() async {
    emit(AuthLoadingState());
    try {
      User? user = await GoogleSignCustom.signInWithGoogle();
      if (user != null) {
        emit(AuthLoadedState());
      }
    } catch (e) {
      emit(AuthCanceledState());
    }
  }

  Future<void> signIn({required String email, password}) async {
    emit(AuthLoadingState());
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        emit(AuthLoadedState());
      } else {
        emit(AuthErrorState(errorText: 'Something went wrong !'));
      }
    } on FirebaseException catch (e) {
      emit(AuthErrorState(errorText: e.message ?? 'Something went wrong !!'));
    } catch (e) {
      emit(AuthErrorState(errorText: 'Something went wrong!'));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(AuthLoadingState());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      emit(AuthLoadedState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(AuthErrorState(errorText: 'Email yoki password noto‘g‘ri'));
      } else if (e.code == 'user-not-found') {
        emit(AuthErrorState(errorText: 'User topilmadi'));
      } else if (e.code == 'wrong-password') {
        emit(AuthErrorState(errorText: 'Password noto‘g‘ri'));
      } else {
        emit(AuthErrorState(errorText: e.message ?? 'Something went wrong!'));
      }
    } catch (_) {
      emit(AuthErrorState(errorText: 'Something went wrong!'));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoadingState());

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());

      emit(AuthLoadedState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthErrorState(errorText: 'Bunday user topilmadi'));
      } else if (e.code == 'invalid-email') {
        emit(AuthErrorState(errorText: 'Email noto‘g‘ri kiritildi'));
      } else {
        emit(AuthErrorState(errorText: e.message ?? 'Something went wrong!'));
      }
    } catch (_) {
      emit(AuthErrorState(errorText: 'Something went wrong!'));
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deleteAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      
      await user?.delete();
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(errorText: e.toString()));
      print(e.code);
    }
  }
}
