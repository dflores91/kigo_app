import 'package:flutter/material.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.ontao,
    required this.isActive,
    required this.buttonText,
    super.key,
  });

  final void Function()? ontao;
  final bool isActive;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontao,
      child: Container(
        width: 290,
        height: 49,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isActive ? green : greyDisabled,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox.shrink(),
            Text(buttonText,
                textAlign: TextAlign.center,
                style: TypographyStyle.robotoRegular12.white),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: white,
            ),
          ],
        ),
      ),
    );
  }
}
