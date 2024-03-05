import 'package:flutter/material.dart';
import 'package:tdm_user_app/constants/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double height;
  final double? width;
  final Color? backgroundColor;
  final bool isGradient;
  final Function()? onPressed;
  final Widget? icon;
  final double fontSize;
  final Color? foregroundColor;
  final double spacing;
  final double elevation;
  final bool isShadow;
  final double radius;
  final bool isLoading;

  const CustomButton(
      {super.key,
      this.onPressed,
      required this.label,
      this.height = 45,
      this.width,
      this.backgroundColor,
      this.foregroundColor,
      this.isGradient = false,
      this.icon,
      this.spacing = 0,
      this.fontSize = 18,
      this.elevation = 0,
      this.isShadow = false,
      this.radius = 10,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              blurRadius: isShadow ? 7 : 0, color: const Color(0x42000000))
        ],
        // gradient: isGradient
        //     ? LinearGradient(colors: [gradient2, gradient3])
        //     : const LinearGradient(
        //         colors: [Colors.transparent, Colors.transparent]),
      ),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              backgroundColor: MaterialStateProperty.all(isGradient
                  ? Colors.transparent
                  : backgroundColor ?? primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: EdgeInsets.only(right: spacing),
                  child: icon!,
                ),
              if (isLoading)
                const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                )
              else
                Text(
                  label,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: foregroundColor ?? Colors.white),
                ),
            ],
          )),
    );
  }
}
