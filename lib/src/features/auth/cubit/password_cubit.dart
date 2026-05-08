import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState.initial());

  void checkPassword(String value) {
    bool hasLetter = value.contains(RegExp(r'[A-Za-z]'));
    bool hasNumber = value.contains(RegExp(r'[0-9]'));
    bool hasMinLength = value.length >= 8;

    if (!hasMinLength) {
      emit(PasswordState(
        strength: 0.2,
        message: "WEAK SECURITY",
        color: Colors.red,
      ));
    } 
    else if (hasLetter && hasNumber) {
      emit(PasswordState(
        strength: 1,
        message: "WEAK SECURITY",
        color: AppColors.green,
      ));
    } 
    else {
      emit(PasswordState(
        strength: 0.4,
        message: "WEAK SECURITY",
        color: Colors.orange,
      ));
    }
  }
}