import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kigo_app/app/aplication/config/injectable.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async =>
    getIt.init(environment: env);
