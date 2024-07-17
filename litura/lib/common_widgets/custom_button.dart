import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_elevated_button.dart';

class CustomButton extends CustomElevatedButton {
  CustomButton({
    super.key,
    required String text,
    required Color textColor,
    required Color color,
    required VoidCallback onPressed,
    IconData? icon,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 24.0, fontWeight: FontWeight.w600),
              ),
              Icon(icon ?? Icons.arrow_forward_ios, color: textColor),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
