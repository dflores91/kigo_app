import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextForm extends StatelessWidget {
  const AppTextForm({
    Key? key,
    this.labelText,
    this.onChanged,
    this.autofocus = false,
    this.hintText,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign,
    this.style,
    this.counter,
  }) : super(key: key);

  final String? labelText;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final TextStyle? style;
  final Widget? counter;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      keyboardType: keyboardType,
      cursorColor: black,
      style: style ?? TypographyStyle.robotoSemiBold18.black,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 4, bottom: 8),
        hintText: hintText,
        hintStyle: TypographyStyle.robotoRegular16.grey,
        labelText: labelText,
        labelStyle: TypographyStyle.robotoRegular14.grey,
        errorStyle: TypographyStyle.robotoRegular13.red,
        focusColor: black,
        enabledBorder: enabledBorder ?? InputBorder.none,
        errorBorder: errorBorder ?? InputBorder.none,
        focusedErrorBorder: focusedErrorBorder ?? InputBorder.none,
        disabledBorder: disabledBorder ?? InputBorder.none,
        focusedBorder: focusedBorder ?? InputBorder.none,
      ),
      onChanged: onChanged,
    );
  }
}
