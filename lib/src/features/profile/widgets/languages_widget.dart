import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class CustomProfileLanguages extends StatelessWidget {
  const CustomProfileLanguages({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.congrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: AppColors.white,
        ),
      ),
    );
  }
}
