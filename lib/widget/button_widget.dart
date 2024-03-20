import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vapiano/utils/constants.dart';


class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  var backgroundColor;
  final width,height;

  double radius;

   ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    this.backgroundColor,
    required this.width,
   required this.height,
     this.radius = 5.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>

      InkWell(
        onTap: onClicked,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: backgroundColor!=null ? backgroundColor : secondaryColor,
          ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),
      ),
    ),
  ),
      );
}