import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomRichText extends StatelessWidget {
  final VoidCallback press;
  final firstText,secondText;
  var firstTextColor;
   CustomRichText({super.key, required this.press, required this.firstText,
    required this.secondText,
    this.firstTextColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: firstText,
      style:  TextStyle(color: firstTextColor),
      children: <InlineSpan>[
        const WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: SizedBox(width: 5.0)),
        TextSpan(
          text: secondText,
          style: const TextStyle(color: primaryColor),
          recognizer: TapGestureRecognizer()
            ..onTap = press,
        ),
      ],
    )
    );
  }
}
