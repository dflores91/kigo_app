import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';

class AppQrButton extends StatelessWidget {
  const AppQrButton({
    required this.buttonText,
    required this.svgPath,
    super.key,
  });

  final String buttonText;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127,
      height: 75,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 5),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath),
          Text(buttonText,
              textAlign: TextAlign.center,
              style: TypographyStyle.robotoMedium10.white),
        ],
      ),
    );
  }
}
