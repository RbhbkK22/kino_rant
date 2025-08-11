import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        cursorColor: Color(0xFF575757),
        style: TextStyle(
          color: Color.fromARGB(255, 150, 150, 150),
          fontSize: 14,
        ),
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          hintText: "E-mail",
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
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextField({super.key, required this.controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.controller,
        cursorColor: Color(0xFF575757),

        obscureText: obscureText,
        style: TextStyle(
          color: Color.fromARGB(255, 150, 150, 150),
          fontSize: 14,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          ),
          suffixIconColor: Color(0xFF656565),
          fillColor: Colors.transparent,
          filled: true,
          hintText: "Password",
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
      ),
    );
  }
}


class UserNameTextField extends StatelessWidget {
  final TextEditingController controller;
  const UserNameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: controller,
        cursorColor: Color(0xFF575757),
        style: TextStyle(
          color: Color.fromARGB(255, 150, 150, 150),
          fontSize: 14,
        ),
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          hintText: "Name",
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
      ),
    );
  }
}