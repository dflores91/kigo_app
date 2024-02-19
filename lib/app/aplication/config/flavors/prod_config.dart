import 'package:injectable/injectable.dart';
import 'package:kigo_app/app/domain/flavors/flavor_config.dart';

@prod
@Injectable(as: FlavorConfig)
class ProdConfig implements FlavorConfig {
  @override
  Future<void> initializeEnvironment() async {
    // Add your production environment specific configurations here
  }

  @override
  String get baseUrl => 'https://legacy.parkimovil.io/m/v1/';
}
