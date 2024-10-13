import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(purple),
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: Colors.white),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width - 20, 45), 
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, 
          fontSize: 20,
        ),
      ),
    );
  }
}