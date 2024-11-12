import 'package:flutter/material.dart';

navigateTo({
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 500),
  required Widget location,
}) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => location,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var curve = Curves.easeInOut;

        var slideTween =
            Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
                .chain(CurveTween(curve: curve)); // Slide up from bottom

        var fadeTween = Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: curve)); // Fade in

        return SlideTransition(
          position: animation.drive(slideTween),
          child: FadeTransition(
            opacity: animation.drive(fadeTween),
            child: child,
          ),
        );
      },
    ),
  );
}

navigateToAndFinish({
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 500),
  required Widget location,
}) {
  return Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => location,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var curve = Curves.easeInOut;

        var slideTween =
            Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
                .chain(CurveTween(curve: curve));

        var fadeTween =
            Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(slideTween),
          child: FadeTransition(
            opacity: animation.drive(fadeTween),
            child: child,
          ),
        );
      },
    ),
    (route) => false,
  );
}
