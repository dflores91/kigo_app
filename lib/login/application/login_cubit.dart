import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kigo_app/login/infrastructure/login_user_repository.dart';
import 'package:kigo_app/login/infrastructure/login_user_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void acceptTerms(bool isChecked) {
    emit(state.copyWith(isChecked: isChecked));
  }

  void valideNumber(String number) {
    final newNumber = number.replaceAll('-', '');
    emit(
      state.copyWith(
          phoneNumber: newNumber,
          isValideNumber: number.replaceAll('-', '').length > 9),
    );
  }

  void valideCode(String code) {
    emit(state.copyWith(code: code, isValideCode: code.length > 5));
  }

  void continueValidateCode() {
    if (RegExp('[^2]').hasMatch(state.phoneNumber)) {
      emit(state.copyWith(showErrorPhone: true));
    } else {
      emit(state.copyWith(
        continueCode: true,
      ));
    }
  }

  Future<void> login() async {
    final userData =
        await LoginUserRepository().loginUser(state.phoneNumber, state.code);

    userData.fold(
      (l) => emit(state.copyWith(showErrorPin: true)),
      (LoginUser? loginUser) => emit(state.copyWith(
          continueHome:
              loginUser!.data.tokenExpiration.isAfter(DateTime.now()))),
    );
  }

  void hideShowErrorPin() {
    emit(state.copyWith(showErrorPin: false));
  }

  void hideShowErrorPhone() {
    emit(state.copyWith(showErrorPhone: false));
  }
}
