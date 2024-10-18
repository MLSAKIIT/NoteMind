import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  //final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    //required this.hintText,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: purple,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        //hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
