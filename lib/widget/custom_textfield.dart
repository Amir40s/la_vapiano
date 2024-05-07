
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
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      validator: (value){
        if(value!.isEmpty){
          return 'field required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade300,
       // suffixIcon: Icon(Icons.visibility,color: Colors.grey,),
        hintStyle: TextStyle(fontSize: 12.0,color: Colors.black),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:  BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
        ),
      ),
      // onSubmitted: (String value) {
      //   debugPrint(value);
      // },
    );
  }
}