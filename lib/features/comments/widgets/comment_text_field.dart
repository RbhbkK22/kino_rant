import 'package:flutter/material.dart';

class CommentTextField extends StatelessWidget {
  final TextEditingController controller;

  const CommentTextField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 1,
      maxLines: 14,
      cursorColor: Color(0xFF575757),
      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: "Расскажите как вам фильм",
        hintStyle: TextStyle(color: Color(0xFF575757), fontSize: 14),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFF2A2A2A)),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFF2A2A2A)),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFF2A2A2A)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
