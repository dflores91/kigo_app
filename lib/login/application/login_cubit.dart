import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kigo_app/login/domain/login_facade.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUserRepository) : super(const LoginState());

  LoginFacade loginUserRepository;

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

  void saveCountryCode(String? code) {
    emit(state.copyWith(areaCode: code));
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
    // final responseLogin = await loginUserRepository.login(
    //     state.phoneNumber, state.areaCode, state.useWhatsapp ? 1 : 0);
  }

  void hideShowErrorPin() {
    emit(state.copyWith(showErrorPin: false));
  }

  void hideShowErrorPhone() {
    emit(state.copyWith(showErrorPhone: false));
  }
}
