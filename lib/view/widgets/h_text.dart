import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  final FontWeight? fontWeight;
  final String? fontFamily;

  const HeadingText(
      {super.key,
      required this.text,
      this.fontSize = 15,
      this.color,
      this.textAlign = TextAlign.center,
      this.maxLines = 2,
      this.fontWeight = FontWeight.normal,
      this.fontFamily
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize.h,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
        fontFamily: fontFamily
      
      ),
    );
  }
}
