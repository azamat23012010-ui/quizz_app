import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.label,
    required this.hinttext,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    this.onchanged
  });

  final String label;
  final String hinttext;
  final Widget icon;
  final bool isPassword;
  final TextEditingController controller;
  final Function(String)? onchanged;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.spaceGrotesk(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppColors.grey,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? isObscure : false,
          onChanged: widget.onchanged,

          style: GoogleFonts.spaceGrotesk(color: AppColors.white),

          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.shark,

            hintText: widget.hinttext,

            hintStyle: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.flord,
            ),

            prefixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: widget.icon,
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.grey,
                    ),
                  )
                : null,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 222, 51, 39),
                width: 0.9,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
