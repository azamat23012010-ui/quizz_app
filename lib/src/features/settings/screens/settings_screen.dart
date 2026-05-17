import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';
import 'package:quiz_app/src/features/auth/cubit/auth_cubit.dart';
import 'package:quiz_app/src/features/profile/widgets/app_bar.dart';
import 'package:quiz_app/src/features/settings/model/item_model.dart';
import 'package:quiz_app/src/features/settings/widgets/sign_out.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        pageName: 'Settings',
        activeActions: false,
        leading: Row(
          children: [
            SizedBox(width: 16),
            Icon(Icons.arrow_back_ios, size: 20, color: AppColors.blue),
            Text(
              'Back',
              style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
        actions: SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sections.length,
                itemBuilder: (_, sectionIndex) {
                  final section = sections[sectionIndex];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.title.toUpperCase(),
                        style: GoogleFonts.workSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.grey,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.mirage,
                          borderRadius: BorderRadius.circular(12),
                          border: BoxBorder.all(
                            width: 1,
                            color: AppColors.congrey,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withAlpha(100),
                              offset: Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          itemCount: section.items.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, itemIndex) {
                            final item = section.items[itemIndex];

                            return Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.blue.withAlpha(45),
                                    ),
                                    child: Icon(
                                      item.icon,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                  title: item.isActive
                                      ? Row(
                                          children: [
                                            Text(
                                              item.title,
                                              style: GoogleFonts.workSans(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2,
                                                horizontal: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(99),
                                                color: AppColors.green
                                                    .withAlpha(50),
                                              ),
                                              child: Text(
                                                'Active',
                                                style: GoogleFonts.spaceGrotesk(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                  color: AppColors.green,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title,
                                              style: GoogleFonts.workSans(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: AppColors.white,
                                              ),
                                            ),

                                            if (item.email != null)
                                              Text(
                                                item.email!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.workSans(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: AppColors.grey,
                                                ),
                                              ),
                                          ],
                                        ),
                                  onTap: item.onTap,
                                  trailing: item.isMode
                                      ? CupertinoSwitch(
                                          activeColor: AppColors.blue,
                                          value: item.isDARK,
                                          onChanged: (bool value) {
                                            setState(() {
                                              section.items[itemIndex] =
                                                  SettingsItem(
                                                    title: item.title,
                                                    icon: item.icon,
                                                    onTap: item.onTap,
                                                    isMode: item.isMode,
                                                    isDARK: value,
                                                    isActive: item.isActive,
                                                    email: item.email,
                                                    isAbout: item.isAbout,
                                                    version: item.version,
                                                  );
                                            });
                                          },
                                        )
                                      : item.version != null
                                      ? Text(
                                          'v${item.version!} (stable)',
                                          style: GoogleFonts.spaceGrotesk(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColors.grey,
                                          ),
                                        )
                                      : item.isAbout
                                      ? Icon(
                                          Icons.ios_share,
                                          color: AppColors.grey,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color: AppColors.grey,
                                        ),
                                ),

                                if (itemIndex != section.items.length - 1)
                                  Divider(
                                    height: 0.5,
                                    color: AppColors.congrey.withAlpha(100),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  );
                },
              ),
              SignOutWidget(
                text: 'Sign Out',
                ontap: () {
                  context.read<AuthCubit>().logout();
                },
              ),
              const SizedBox(height: 24),
              SignOutWidget(
                text: 'Delete account',
                ontap: () {
                  context.read<AuthCubit>().deleteAccount();
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  final sections = [
    SettingsSection(
      title: 'Account',
      items: [
        SettingsItem(
          title: 'Edit email',
          icon: Icons.email_outlined,
          onTap: () {},
          isMode: false,
          isDARK: false,
          isAbout: false,
          isActive: false,
          email: FirebaseAuth.instance.currentUser?.email ?? 'no email',
        ),
        SettingsItem(
          title: 'Change Password',
          icon: Icons.lock_outline,
          onTap: () {},
          isMode: false,
          isDARK: false,
          isAbout: false,
          isActive: false,
        ),
        SettingsItem(
          title: 'GitHub Integration',
          icon: Icons.terminal,
          onTap: () {},
          isMode: false,
          isDARK: false,
          isAbout: false,
          isActive: true,
        ),
      ],
    ),
    SettingsSection(
      title: 'Preferences',
      items: [
        SettingsItem(
          title: 'Dark Mode',
          icon: Icons.dark_mode_outlined,
          onTap: () {},
          isMode: true,

          isDARK: true,

          isAbout: false,
          isActive: false,
        ),
        SettingsItem(
          title: 'Notifications',
          icon: Icons.notifications_none_outlined,
          onTap: () {},
          isMode: true,

          isDARK: false,
          isAbout: false,
          isActive: false,
        ),
        SettingsItem(
          title: 'Haptic Feedback',
          icon: Icons.vibration,
          onTap: () {},
          isMode: true,

          isDARK: false,
          isAbout: false,
          isActive: false,
        ),
      ],
    ),
    SettingsSection(
      title: 'About',
      items: [
        SettingsItem(
          title: 'Privacy Policy',
          icon: Icons.policy_outlined,
          onTap: () {},
          isMode: false,
          isDARK: false,
          isAbout: true,
          isActive: false,
        ),
        SettingsItem(
          title: 'Terms of Service',
          icon: Icons.gavel_outlined,
          onTap: () {},
          isMode: false,
          isDARK: false,
          isAbout: true,
          isActive: false,
        ),
        SettingsItem(
          title: 'App Version',
          icon: Icons.info_outline,
          onTap: () {},
          isMode: false,
          isDARK: false,
          isAbout: false,
          isActive: false,
          version: '1.0.0+1',
        ),
      ],
    ),
  ];
}
