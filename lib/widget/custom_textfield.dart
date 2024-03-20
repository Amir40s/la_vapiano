
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vapiano/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  bool isSuffix = false;

   CustomTextField({Key? key,
     required this.hintText,
     required this.controller,
    this.isSuffix = false
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: whiteColor,
       // suffixIcon: Icon(Icons.visibility,color: Colors.grey,),
        hintStyle: TextStyle(fontSize: 12.0,color: Colors.grey),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2.0),
        ),
      ),
      onSubmitted: (String value) {
        debugPrint(value);
      },
    );
  }
}