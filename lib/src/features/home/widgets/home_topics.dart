import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class HomeTopicCard extends StatelessWidget {
  const HomeTopicCard({
    super.key,
    required this.name,
    required this.image,
    required this.maxPuzzle,
    required this.solved,
    required this.imageColor,
    required this.percentColor,
  });

  final String name;
  final Widget image;
  final int maxPuzzle;
  final int solved;
  final Color imageColor;
  final Color percentColor;

  @override
  Widget build(BuildContext context) {
    final progress = (solved / maxPuzzle).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.flord, width: 1),
        color: AppColors.mirage,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: imageColor,
            ),
            child: image,
          ),

          const SizedBox(height: 16),

          Text(
            name,
            style: GoogleFonts.workSans(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: AppColors.white,
            ),
          ),

          Text(
            '$solved/$maxPuzzle Puzzles',
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        color: AppColors.congrey,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: Durations.medium1,
                          width: constraints.maxWidth * progress,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: percentColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${(progress * 100).toInt()}%',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}