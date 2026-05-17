import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/core/const/icons/app_icons.dart';
import 'package:quiz_app/src/core/const/images/app_images.dart';
import 'package:quiz_app/src/features/profile/widgets/app_bar.dart';
import 'package:quiz_app/src/core/widgets/app_button.dart';
import 'package:quiz_app/src/core/widgets/app_container.dart';
import 'package:quiz_app/src/features/profile/widgets/custom_row.dart';
import 'package:quiz_app/src/features/profile/widgets/custom_text2_profile.dart';
import 'package:quiz_app/src/features/profile/widgets/languages_widget.dart';
import 'package:quiz_app/src/features/profile/widgets/location_buttton.dart';
import 'package:quiz_app/src/features/profile/widgets/profile_perccent.dart';
import 'package:quiz_app/src/features/profile/widgets/text_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> languages = ['Rust', 'TS', 'Py'];
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios, size: 20),
        actions: SizedBox(),
        activeActions: true,
        pageName: 'Profile',
        ontapActions: () {
          Navigator.pushNamed(context, '/settings');
        },
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
                        ? NetworkImage(user!.photoURL!) as ImageProvider
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
            Flexible(
              child: Text(
                '@${user?.email}',
                maxLines: 1,
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.white,
                ),
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
            Row(
              children: [
                Expanded(
                  child: AppContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRowProfile(
                          label: 'Solved'.toUpperCase(),
                          icon: AppIcons.solved,
                        ),
                        SizedBox(height: 5),
                        CustomTextProfile(text: '125'),
                        SizedBox(height: 12),
                        ProfilePercent(value: 125),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRowProfile(
                          icon: AppIcons.rank,
                          label: 'Global Rank'.toUpperCase(),
                        ),
                        SizedBox(height: 5),
                        CustomTextProfile(text: 'Top 5%'),
                        SizedBox(height: 12),
                        CustomText2Profile(text: '1.2k spots jumped this week'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: AppContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRowProfile(icon: AppIcons.fire, label: 'streak'),
                        SizedBox(height: 5),
                        CustomTextProfile(text: '12 Days'),
                        SizedBox(height: 12),
                        CustomText2Profile(text: 'Next reward: 15 days'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRowProfile(
                          icon: AppIcons.code,
                          label: 'Languages',
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: List.generate(languages.length, (index) {
                            return CustomProfileLanguages(
                              text: languages[index],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
