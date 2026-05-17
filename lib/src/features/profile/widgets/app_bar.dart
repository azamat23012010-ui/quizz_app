import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.pageName,
    required this.activeActions,
    required this.leading,
    required this.actions,this.ontapActions,
  });
  final String pageName;
  final bool activeActions;
  final Widget leading;
  final Widget actions;
  final VoidCallback? ontapActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      toolbarHeight: 70,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.grey.withOpacity(0.2)),
      ),
      backgroundColor: AppColors.primary,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: leading,
      ),
      centerTitle: true,
      title: Text(
        pageName,
        style: GoogleFonts.workSans(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      actions: [
        activeActions ? GestureDetector(
          onTap: ontapActions,
          child: Icon(Icons.settings, size: 24)) : actions,
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
