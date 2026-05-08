part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorText;

  AuthErrorState({required this.errorText});

}

class AuthLoadedState extends AuthState {}
