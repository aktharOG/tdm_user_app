import 'package:flutter/material.dart';
import 'package:tdm_user_app/constants/app_theme.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

push(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

pushAndReplace(BuildContext context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

pushAndRemoveUntil(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
    (_) => false,
  );
}

pushNamedAndRemoveUntil(BuildContext context, page) {
  Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
}

showSnackBar(BuildContext context, String message,
    {Color? color, Duration? duration, double margin = 10,SnackBarAction? action}) {
       ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    action: action,
    margin: EdgeInsets.only(bottom: margin),
    elevation: 5.0,
    behavior: SnackBarBehavior.floating,
    duration: duration ?? const Duration(seconds: 1),
    content: Text(message),
    backgroundColor: color ?? primaryColor,
  ));
}
