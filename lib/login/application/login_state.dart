part of 'login_cubit.dart';

final class LoginState extends Equatable {
  final String phoneNumber;
  final String code;
  final bool isChecked;
  final bool isValideNumber;
  final bool isValideCode;
  final bool continueCode;
  final bool continueHome;
  final bool showErrorPin;
  final bool showErrorPhone;

  const LoginState({
    this.phoneNumber = '',
    this.code = '',
    this.isChecked = false,
    this.isValideNumber = false,
    this.isValideCode = false,
    this.continueCode = false,
    this.continueHome = false,
    this.showErrorPin = false,
    this.showErrorPhone = false,
  });

  @override
  List<Object?> get props => [
        phoneNumber,
        code,
        isChecked,
        isValideNumber,
        isValideCode,
        continueCode,
        continueHome,
        showErrorPin,
        showErrorPhone,
      ];

  LoginState copyWith({
    String? phoneNumber,
    String? code,
    bool? isChecked,
    bool? isValideNumber,
    bool? isValideCode,
    bool? continueCode,
    bool? continueHome,
    bool? showErrorPin,
    bool? showErrorPhone,
  }) =>
      LoginState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        code: code ?? this.code,
        isChecked: isChecked ?? this.isChecked,
        isValideNumber: isValideNumber ?? this.isValideNumber,
        isValideCode: isValideCode ?? this.isValideCode,
        continueCode: continueCode ?? this.continueCode,
        continueHome: continueHome ?? this.continueHome,
        showErrorPin: showErrorPin ?? this.showErrorPin,
        showErrorPhone: showErrorPhone ?? this.showErrorPhone,
      );

  @override
  bool get stringify => true;
}
