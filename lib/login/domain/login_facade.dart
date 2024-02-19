import 'package:dartz/dartz.dart';
import 'package:kigo_app/login/infrastructure/login_response.dart';

abstract class LoginFacade {
  Future<Either<Exception, LoginResponse?>> login(
      String phone, String areaCode, int useWhatsapp);

  Future<void> registerUser(
      String userName,
      String lastName,
      String phoneAreaCode,
      String phoneNumber,
      bool useWhatsapp,
      String password);
}
