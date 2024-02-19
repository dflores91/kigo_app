import 'package:flutter/material.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    required this.isActive,
    required this.buttonText,
    super.key,
  });

  final void Function()? onTap;
  final bool isActive;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(buttonText,
                textAlign: TextAlign.center,
                style: TypographyStyle.robotoRegular12.white),
            const Spacer(),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
