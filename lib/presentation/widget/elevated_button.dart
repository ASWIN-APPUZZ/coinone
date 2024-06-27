import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors().colorBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: AppColors().colorWhite),
        ),
      ),
    );
  }
}