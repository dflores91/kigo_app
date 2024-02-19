import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kigo_app/app/domain/api_client/api_client.dart';
import 'package:kigo_app/app/domain/api_client/api_request.dart';
import 'package:kigo_app/app/domain/storage/app_storage.dart';
import 'package:kigo_app/login/domain/login_facade.dart';
import 'package:kigo_app/login/infrastructure/login_response.dart';

@Injectable(as: LoginFacade)
class LoginRepository extends LoginFacade {
  final AppStorage _appStorage;
  final ApiClient _apiClient;

  LoginRepository(this._appStorage, this._apiClient);

  @override
  Future<Either<Exception, LoginResponse?>> login(
      String phone, String areaCode, int useWhatsapp) async {
    var headers = {
      'x-api-key': 'WiZPDQyTr49585pDSrY9p1weQmD4fvSK55251ZVL',
      'x-platform': 'gms',
      'x-version': '6002025',
      'x-country': 'mx',
      'Content-Type': 'application/json'
    };

    final response = await _apiClient.request(
      ApiRequest.post(
        '/users/phone-login',
        headers: headers,
        body: {
          "areaCode": areaCode,
          "phone": phone,
          "useWhatsapp": useWhatsapp
        },
      ),
      (json) => json != null ? LoginResponse.fromJson(jsonDecode(json)) : null,
    );

    if (response != null) {
      try {
        return Right(response);
      } catch (e) {
        log(e.toString());
        return Left(Exception('Failed login'));
      }
    } else {
      return Left(Exception('Failed login'));
    }
  }

  @override
  Future<void> registerUser(
      String userName,
      String lastName,
      String phoneAreaCode,
      String phoneNumber,
      bool useWhatsapp,
      String password) async {
    final token = _appStorage.getValue<String>(Keys.appUserToken);

    var headers = {
      'x-api-key': 'WiZPDQyTr49585pDSrY9p1weQmD4fvSK55251ZVL',
      'x-platform': 'gms',
      'x-version': '6002025',
      'x-country': 'mx',
      'x-token': token ?? '',
      'Content-Type': 'application/json'
    };

    final response = await _apiClient.request(
      ApiRequest.post(
        '/users/phone-login',
        headers: headers,
        body: {
          "username": userName,
          "lastName": lastName,
          "phoneAreaCode": phoneAreaCode,
          "phoneNumber": phoneNumber,
          "useWhatsapp": useWhatsapp,
          "password": password
        },
      ),
      (json) => log(json),
    );
  }

  Future<void> verifyCode(String areaCode, String phone, String code,
      double lat, double lng) async {
    final token = _appStorage.getValue<String>(Keys.appUserToken);
    var headers = {
      'x-token': token ?? '',
      'x-api-key': 'WiZPDQyTr49585pDSrY9p1weQmD4fvSK55251ZVL',
      'x-platform': 'gms',
      'x-version': '6002025',
      'x-country': 'mx',
      'Content-Type': 'application/json'
    };

    final response = await _apiClient.request(
      ApiRequest.post(
        '/users/verify-login?lat=$lat&lng=&$lng',
        headers: headers,
        body: {"areaCode": areaCode, "phone": phone, "code": code},
      ),
      (json) => log(json),
    );
  }
}
