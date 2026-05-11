import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class AuthNavbarWidget extends StatelessWidget {
  const AuthNavbarWidget({
    super.key,
    required this.labelText,
    required this.navText, required this.recongizer,
  });
  final String labelText;
  final String navText;
  final VoidCallback recongizer;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$labelText ',
        style: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.grey,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = recongizer,
            text: navText,
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
