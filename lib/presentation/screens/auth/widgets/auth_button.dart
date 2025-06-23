import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
              ),
              minimumSize: WidgetStatePropertyAll(Size(double.infinity, 53)),
              backgroundColor: WidgetStatePropertyAll(Color(0xFFEB2F3D)),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
  }
}