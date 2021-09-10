import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final controller;
  final hintText;
  final prefixIcon;
  const InputField({Key? key, this.controller, this.hintText, this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 64,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      // padding: EdgeInsets.symmetric(horizontal: 8),

      child: TextFormField(
        // initialValue: isName ? "JoneWilliams@gmail.com" : null,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 26,
        cursorColor: Colors.white,
        style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400], letterSpacing: 1.1),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
