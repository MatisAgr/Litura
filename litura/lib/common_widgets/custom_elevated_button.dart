import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.color,
    this.height = 80.0,
    this.borderRadius = 9.0,
    required this.onPressed,
  });

  final Widget child;
  final Color color;
  final double height;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
            ),

          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0), // Added padding
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
