import 'package:injectable/injectable.dart';
import 'package:kigo_app/app/aplication/config/injectable.dart';
import 'package:kigo_app/app/domain/api_client/api_client.dart';
import 'package:kigo_app/app/domain/flavors/flavor_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class Modules {
  ApiClient get client {
    return ApiClient(
      baseUrl: getIt.get<FlavorConfig>().baseUrl,
      headers: {'Accept': 'application/json'},
      interceptors: [PrettyDioLogger()],
    );
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
