import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class ProfilePercent extends StatelessWidget {
  const ProfilePercent({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    final progress = (value / 200).clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: AppColors.congrey,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: constraints.maxWidth * progress,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: AppColors.orange,
              ),
            ),
          ),
        );
      },
    );
  }
}