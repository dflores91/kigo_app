import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kigo_app/app/aplication/utils/phone_format.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';
import 'package:kigo_app/app/presentation/widgets/app_kigo_logo.dart';
import 'package:kigo_app/app/presentation/widgets/app_switch_adaptative.dart';
import 'package:kigo_app/login/application/login_cubit.dart';
import 'package:kigo_app/app/presentation/widgets/app_textform.dart';

class PhoneForm extends StatelessWidget {
  const PhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 44,
          ),
          const AppLogoKigo(),
          const SizedBox(
            height: 34,
          ),
          Text('Ingresa con tu número celular',
              textAlign: TextAlign.center,
              style: TypographyStyle.robotoSemiBold16.w700),
          const SizedBox(
            height: 28,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone_android_rounded,
                color: greyDisabled,
              ),
              CountryCodePicker(
                onChanged: (CountryCode? code) =>
                    context.read<LoginCubit>().saveCountryCode(code?.code),
                flagWidth: 30,
                initialSelection: 'MX',
              ),
              Expanded(
                child: AppTextForm(
                    hintText: 'Teléfono celular',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                      PhoneInputFormatter(),
                    ],
                    onChanged: (String value) =>
                        context.read<LoginCubit>().valideNumber(value)),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
            color: greyDisabled,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              AppSwitchAdaptative(
                  isChecked: state.isChecked,
                  onChanged: (bool value) =>
                      context.read<LoginCubit>().acceptTerms(value)),
              const SizedBox(width: 19),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Acepto ',
                        style: TypographyStyle.robotoRegular14.black),
                    TextSpan(
                      text: 'Política de privacidad,\ntérminos y condiciones',
                      style: TypographyStyle.robotoRegular14.orange,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
