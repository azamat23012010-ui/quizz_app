import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/features/home/widgets/mini_widgets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.user, required this.ontap});

  final User? user;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      automaticallyImplyLeading: false,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.grey.withOpacity(0.2)),
      ),
      title: Row(
        children: [
          GestureDetector(
            onTap: ontap,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: user?.photoURL != null
                  ? NetworkImage(user!.photoURL!)
                  : null,
              backgroundColor: AppColors.blue.withAlpha(75),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: AppColors.grey,
                ),
              ),
              Text(
                user?.displayName ?? 'no name',
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        AppbarMiniWidget(icon: Icon(Icons.search, color: AppColors.white)),
        const SizedBox(width: 8),
        AppbarMiniWidget(
          icon: Icon(Icons.notifications_none, color: AppColors.white),
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
