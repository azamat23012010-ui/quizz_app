import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class CustomText2Profile extends StatelessWidget {
  const CustomText2Profile({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        maxLines: 1,
        style: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
