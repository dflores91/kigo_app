import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kigo_app/app/aplication/utils/format_extension.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';
import 'package:kigo_app/login/application/login_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeForm extends StatelessWidget {
  const CodeForm({super.key});

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
          SvgPicture.asset(
            'images/svg/logo-kigo-parkimovil.svg',
            height: 36,
            width: 125,
          ),
          const SizedBox(
            height: 34,
          ),
          Text('Ingresa el código enviado a:',
              textAlign: TextAlign.center,
              style: TypographyStyle.robotoSemiBold16.w700),
          const SizedBox(
            height: 14,
          ),
          Text(
            state.phoneNumber.formatAsPhone,
            style: TypographyStyle.kanitBold20.green,
          ),
          const SizedBox(
            height: 14,
          ),
          PinCodeTextField(
            appContext: context,
            length: 6,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              activeColor: lightGrey,
              selectedColor: lightGrey,
              selectedFillColor: lightGrey,
              inactiveColor: lightGrey,
              inactiveFillColor: lightGrey,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            keyboardType: TextInputType.number,
            boxShadows: const [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black12,
                blurRadius: 10,
              )
            ],
            onCompleted: (String value) {
              context.read<LoginCubit>().valideCode(value);
            },
          ),
        ],
      ),
    );
  }
}
