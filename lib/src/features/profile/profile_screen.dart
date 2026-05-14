import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/core/const/icons/app_icons.dart';
import 'package:quiz_app/src/core/const/images/app_images.dart';
import 'package:quiz_app/src/core/widgets/app_button.dart';
import 'package:quiz_app/src/features/profile/widgets/location_buttton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User?;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColors.grey.withOpacity(0.2)),
        ),
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, size: 24)),
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.workSans(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        actions: [Icon(Icons.settings, size: 24), const SizedBox(width: 16)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Stack(
              children: [
                CircleAvatar(
                  radius: 67,
                  backgroundColor: AppColors.blue,
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL!)
                        : AssetImage(AppImages.user),
                    backgroundColor: AppColors.blue.withAlpha(75),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.blue,
                      child: Icon(
                        Icons.verified_outlined,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '@${user?.email}',
              style: GoogleFonts.workSans(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppColors.white,
              ),
            ),
            Text(
              'Puzzle Solver | Full Stack Architect',
              style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 10),
            CuromLocationButton(text: 'San Francisco, CA'),
            const SizedBox(height: 24),
            AppButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.stich),
                  const SizedBox(width: 8),
                  Text(
                    'Edit Profile',
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (_, int index) {
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
