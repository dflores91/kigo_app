import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';

class AppParkingbutton extends StatelessWidget {
  const AppParkingbutton({
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
      height: 49,
      padding: const EdgeInsets.only(top: 7, left: 9, right: 9, bottom: 7),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: orangeDisable,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: white,
            child: SvgPicture.asset(svgPath),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(buttonText, style: TypographyStyle.robotoMedium10.white),
        ],
      ),
    );
  }
}
