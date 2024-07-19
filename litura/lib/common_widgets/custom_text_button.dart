import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Color backgroundColor;
  final String txt;
  final IconData iconData;
  final VoidCallback onPressed;

  const CustomTextButton({
  super.key,
	required this.backgroundColor,
  required this.txt,
	required this.iconData,
	required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
	return TextButton(
	  style: TextButton.styleFrom(
		backgroundColor: backgroundColor,
		minimumSize: const Size(110.0, 40.0),
		shape: RoundedRectangleBorder(
		  borderRadius: BorderRadius.circular(5.0),
		  side: const BorderSide(color: Colors.white),
		),
	  ),
	  onPressed: onPressed,
	  child: Row(
		mainAxisSize: MainAxisSize.min,
		children: [
		  Text(
      txt,
			style: const TextStyle(
			  color: Colors.white,
			  fontFamily: 'Numans',
			),
		  ),
		  const SizedBox(width: 8),
		  Icon(
			iconData,
			color: Colors.white,
		  ),
		],
	  ),
	);
  }
}