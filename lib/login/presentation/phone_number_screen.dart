import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';
import 'package:kigo_app/home/presentation/home_screen.dart';
import 'package:kigo_app/login/application/login_cubit.dart';
import 'package:kigo_app/login/presentation/widgets/app_button.dart';
import 'package:kigo_app/login/presentation/widgets/code_form.dart';
import 'package:kigo_app/login/presentation/widgets/phone_form.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.showErrorPhone) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Center(child: Text('Teléfono no valido')),
              onVisible: () => context.read<LoginCubit>().hideShowErrorPhone(),
            ),
          );
        }
        if (state.showErrorPin) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Center(
                  child: Text('Código no valido, vuelve a intentarlo')),
              onVisible: () => context.read<LoginCubit>().hideShowErrorPin(),
            ),
          );
        }
        if (state.continueHome) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomeScreen(),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: orange,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              Center(
                child: Container(
                  width: 350,
                  height: 520,
                  decoration: ShapeDecoration(
                    color: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (state.continueCode)
                          const CodeForm()
                        else
                          const PhoneForm(),
                        const Spacer(),
                        if (state.continueCode)
                          AppButton(
                            ontao: state.isValideCode
                                ? () => context.read<LoginCubit>().login()
                                : null,
                            isActive: state.isValideCode,
                            buttonText: 'Continuar',
                          )
                        else
                          AppButton(
                            ontao: state.isChecked && state.isValideNumber
                                ? () => context
                                    .read<LoginCubit>()
                                    .continueValidateCode()
                                : null,
                            isActive: state.isChecked && state.isValideNumber,
                            buttonText: 'Recibir código por SMS',
                          ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          '¿Necesitas ayuda?',
                          textAlign: TextAlign.center,
                          style: TypographyStyle.robotoMedium13.naviBlue,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Text(
                '¡Que nada te detenga!',
                textAlign: TextAlign.center,
                style: TypographyStyle.kanitBold20.white,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '© 2023 Kigo - Parkimovil\nTodos los derechos reservados ',
                textAlign: TextAlign.center,
                style: TypographyStyle.robotoRegular12.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
