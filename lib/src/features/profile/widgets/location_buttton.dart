import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class CuromLocationButton extends StatelessWidget {
  const CuromLocationButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.blue.withAlpha(50),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_outlined, color: AppColors.blue, size: 14),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
