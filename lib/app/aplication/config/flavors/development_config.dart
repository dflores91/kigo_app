import 'package:injectable/injectable.dart';
import 'package:kigo_app/app/domain/flavors/flavor_config.dart';

@dev
@Injectable(as: FlavorConfig)
class DevelopmentConfig implements FlavorConfig {
  @override
  Future<void> initializeEnvironment() async {
    // Add your development environment specific configurations here
  }

  @override
  String get baseUrl => 'https://legacy.parkimovil.io/m/v1/';
}
