import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({super.key, required this.text, required this.ontap});
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.red.withAlpha(50),
          border: Border.all(width: 1, color: AppColors.red.withAlpha(80)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: AppColors.red),
            const SizedBox(width: 8),
            Text(
              text,
              style: GoogleFonts.workSans(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
