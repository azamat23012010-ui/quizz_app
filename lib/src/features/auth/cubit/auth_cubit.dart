import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

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

  Future<void> logIn({required String email, password}) async {
    emit(AuthLoadingState());
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        // * Loaded
        emit(AuthLoadedState());
      } else {
        emit(AuthErrorState(errorText: 'Something went wrong !'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(errorText: e.message ?? 'Something went wrong !'));
    } catch (error) {
      emit(AuthErrorState(errorText: 'Something went wrong !'));
    }
  }
  
}
