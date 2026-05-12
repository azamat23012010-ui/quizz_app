import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/core/const/icons/app_icons.dart';
import 'package:quiz_app/src/core/const/images/app_images.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({
    super.key,
    required this.date,
    required this.level,
    required this.xp,
  });

  final int date;
  final int level;
  final int xp;

  @override
  Widget build(BuildContext context) {
    final progress = (xp / 1000).clamp(0.0, 1.0);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.mirage,
            border: Border.all(width: 1,color: AppColors.flord)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: AppColors.congrey,
                      border: Border.all(
                        width: 1,
                        color: AppColors.flord,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.fire),
                        const SizedBox(width: 8),
                        Text(
                          '$date Day Streak',
                          style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.star),
                  const SizedBox(width: 4),
                  Text(
                    'Lvl $level',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                'Daily Goal Progress',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),

              RichText(
                text: TextSpan(
                  text: '$xp',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: AppColors.white,
                  ),
                  children: [
                    TextSpan(
                      text: ' / 1000 XP',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: AppColors.slategrey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: double.infinity,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.congrey,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedContainer(
                        duration: Durations.medium1,
                        width: constraints.maxWidth * progress,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Text(
                    'Keep it up! ${1000 - xp} XP to next level',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'View Stats >',
                    style: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          width: 200,
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: Image.asset(AppImages.leftlight),
          ),
        ),

        Positioned(
          width: 200,
          top: 0,
          right: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
            ),
            child: Image.asset(AppImages.rightlight),
          ),
        ),
      ],
    );
  }
}