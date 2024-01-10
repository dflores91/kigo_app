import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kigo_app/login/application/login_cubit.dart';
import 'package:kigo_app/login/presentation/phone_number_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: const PhoneNumberScreen(),
    );
  }
}
