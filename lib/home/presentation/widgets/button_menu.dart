import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';

class AppButtonMenu extends StatelessWidget {
  const AppButtonMenu({
    required this.svgPath,
    required this.label,
    this.isSelected = false,
    super.key,
  });

  final String svgPath;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: white,
          width: 74,
          child: SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.asset(svgPath),
          ),
        ),
        const SizedBox(height: 3),
        Text(label,
            textAlign: TextAlign.center,
            style: isSelected
                ? TypographyStyle.robotoMedium10.orange
                : TypographyStyle.robotoMedium10.greyDisabled),
      ],
    );
  }
}
