import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.child, required this.onPressed});
  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 48),
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        elevation: 10,
        shadowColor: AppColors.blue.withAlpha(120),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
