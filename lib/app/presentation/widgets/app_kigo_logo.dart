import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogoKigo extends StatelessWidget {
  const AppLogoKigo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/svg/logo-kigo-parkimovil.svg',
      height: 36,
      width: 125,
    );
  }
}
