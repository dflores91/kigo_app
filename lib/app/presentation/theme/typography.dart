import 'package:kigo_app/app/presentation/theme/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double _size10 = 10.sp;
double _size12 = 12.sp;
double _size13 = 13.sp;
double _size14 = 14.sp;
double _size16 = 16.sp;
double _size18 = 18.sp;
double _size20 = 20.sp;

class TypographyStyle {
  static final TextStyle robotoMedium10 = TextStyle(
    fontSize: _size10,
    letterSpacing: -0.40.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 1.3.h,
  );

  static final TextStyle robotoRegular12 = TextStyle(
    fontSize: _size12,
    letterSpacing: -0.38.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.33.h,
  );

  static final TextStyle robotoRegular13 = TextStyle(
    fontSize: _size13,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.4.h,
  );

  static final TextStyle robotoMedium13 = TextStyle(
    fontSize: _size13,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 1.4.h,
  );

  static final TextStyle robotoRegular14 = TextStyle(
    fontSize: _size14,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.3.h,
  );

  static final TextStyle robotoMedium14 = TextStyle(
    fontSize: _size14,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 1.3.h,
  );

  static final TextStyle robotoRegular16 = TextStyle(
    fontSize: _size16,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.3.h,
  );

  static final TextStyle robotoSemiBold16 = TextStyle(
    fontSize: _size16,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.3.h,
  );

  static final TextStyle robotoSemiBold18 = TextStyle(
    fontSize: _size18,
    letterSpacing: -0.32.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.3.h,
  );

  static final TextStyle kanitBold20 = TextStyle(
    fontSize: _size20,
    letterSpacing: -0.40.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.45.h,
  );
}

extension BetterString on String {
  String get text => this;

  TextStyle get robotoMedium10 => TypographyStyle.robotoMedium10
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoRegular12 => TypographyStyle.robotoRegular12
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoRegular13 => TypographyStyle.robotoRegular13
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoMedium13 => TypographyStyle.robotoMedium13
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoRegular14 => TypographyStyle.robotoRegular14
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoMedium14 => TypographyStyle.robotoMedium14
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoRegular16 => TypographyStyle.robotoRegular16
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoSemiBold16 => TypographyStyle.robotoSemiBold16
      .copyWith(fontFamilyFallback: <String>[text]);
  TextStyle get robotoSemiBold18 => TypographyStyle.robotoSemiBold18
      .copyWith(fontFamilyFallback: <String>[text]);
}

extension BetterStyle on TextStyle {
  TextStyle get black => copyWith(color: colors.black);
  TextStyle get orange => copyWith(color: colors.orange);
  TextStyle get orangeDisable => copyWith(color: colors.orangeDisable);
  TextStyle get white => copyWith(color: colors.white);
  TextStyle get grey => copyWith(color: colors.grey);
  TextStyle get greyDisabled => copyWith(color: colors.greyDisabled);
  TextStyle get red => copyWith(color: colors.red);
  TextStyle get blue => copyWith(color: colors.blue);
  TextStyle get naviBlue => copyWith(color: colors.navyBlue);
  TextStyle get green => copyWith(color: colors.green);
  TextStyle get lightGray => copyWith(color: colors.lightGrey);

  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}
