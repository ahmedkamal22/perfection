import 'package:flutter/material.dart';
import 'package:perfection/core/utils/images.dart';

class PerfectionLogo extends StatelessWidget {
  const PerfectionLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.perfectionLogo,
    );
  }
}
