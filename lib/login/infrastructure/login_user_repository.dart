import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kigo_app/login/infrastructure/login_user_response.dart';

class LoginUserRepository {
  Future<Either<Exception, LoginUser?>> loginUser(
      String phone, String code) async {
    final request = http.Request(
        'GET',
        Uri.parse(
            'https://mp5427bc2f5bcfe97a93.free.beeceptor.com/kigo-login/$phone/$code'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      try {
        final json = await response.stream.bytesToString();
        final loginUser = LoginUser.fromJson(jsonDecode(json));
        return Right(loginUser);
      } catch (e) {
        log(e.toString());
        return Left(Exception('Failed login'));
      }
    } else {
      return Left(Exception('Failed login'));
    }
  }
}
