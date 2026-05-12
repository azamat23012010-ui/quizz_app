import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class AppbarMiniWidget extends StatelessWidget {
  const AppbarMiniWidget({super.key, required this.icon});
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.shark,
      child: icon,
    );
  }
}

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.workSans(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: AppColors.white,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            'See All',
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
