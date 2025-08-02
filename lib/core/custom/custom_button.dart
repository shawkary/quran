import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.teal,
  });
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: CircleAvatar(
        radius: MediaQuery.sizeOf(context).width * .225,
        backgroundColor: backgroundColor,
        child: RawMaterialButton(
          shape: const CircleBorder(),
          constraints: BoxConstraints.tightFor(
            width: MediaQuery.sizeOf(context).width * .45,
            height: MediaQuery.sizeOf(context).width * .45,
          ),
          onPressed: onPressed,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
