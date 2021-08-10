import 'dart:async';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerText;
  final IconData preIcon;
  final String hint;

  const CustomTextField({
    Key? key,
    // required this.controllerText,
    required this.preIcon,
    required this.hint,
    required this.controllerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(color: Colors.blue),
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: TextFormField(
        controller: controllerText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: Icon(
            preIcon,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
