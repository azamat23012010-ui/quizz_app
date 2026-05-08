import 'package:flutter/material.dart';

class PasswordState {
  final double strength;
  final String message;
  final Color color;

  PasswordState({
    required this.strength,
    required this.message,
    required this.color,
  });

  factory PasswordState.initial() {
    return PasswordState(
      strength: 0,
      message: "WEAK SECURITY",
      color: Colors.red,
    );
  }
}