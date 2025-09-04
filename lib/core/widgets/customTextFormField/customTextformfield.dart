import 'package:flutter/material.dart';

import '../../theme/palette.dart';
import '../text/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
  }) : super(key: key);

  // var mediaQuery = MediaQuery.of(context).size;
  // double fontSize = mediaQuery.width * 0.035; // e.g., ~14 at 400px width
  // double verticalPadding = mediaQuery.height * 0.015;
  // double horizontalPadding = mediaQuery.width * 0.04;
  // double iconSize = mediaQuery.width * 0.06;
  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.s16(label,color: Colors.black,bold: true,),
           SizedBox(height: mediaQuery.height*0.01),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onSuffixTap,
              )
                  : null,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Palette.appColors.mainColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Palette.appColors.mainColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Palette.appColors.mainColor,
                  width: 2.0,
                ),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),

          ),
        ],
      ),
    );
  }
}
