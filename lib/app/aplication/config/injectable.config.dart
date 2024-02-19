// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kigo_app/app/aplication/auth/auth_cubit.dart' as _i4;
import 'package:kigo_app/app/aplication/config/flavors/development_config.dart'
    as _i6;
import 'package:kigo_app/app/aplication/config/flavors/prod_config.dart' as _i7;
import 'package:kigo_app/app/aplication/config/modules.dart' as _i14;
import 'package:kigo_app/app/domain/api_client/api_client.dart' as _i3;
import 'package:kigo_app/app/domain/flavors/flavor_config.dart' as _i5;
import 'package:kigo_app/app/domain/storage/app_storage.dart' as _i9;
import 'package:kigo_app/app/infrastructure/app_storage_services/app_storage_key_value.dart'
    as _i10;
import 'package:kigo_app/login/application/login_cubit.dart' as _i13;
import 'package:kigo_app/login/domain/login_facade.dart' as _i11;
import 'package:kigo_app/login/infrastructure/login_repository.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modules = _$Modules();
    gh.factory<_i3.ApiClient>(() => modules.client);
    gh.factory<_i4.AuthCubit>(() => _i4.AuthCubit());
    gh.factory<_i5.FlavorConfig>(
      () => _i6.DevelopmentConfig(),
      registerFor: {_dev},
    );
    gh.factory<_i5.FlavorConfig>(
      () => _i7.ProdConfig(),
      registerFor: {_prod},
    );
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => modules.prefs,
      preResolve: true,
    );
    gh.factory<_i9.AppStorage>(
        () => _i10.AppStorageKeyValue(gh<_i8.SharedPreferences>()));
    gh.factory<_i11.LoginFacade>(() => _i12.LoginRepository(
          gh<_i9.AppStorage>(),
          gh<_i3.ApiClient>(),
        ));
    gh.factory<_i13.LoginCubit>(() => _i13.LoginCubit(gh<_i11.LoginFacade>()));
    return this;
  }
}

class _$Modules extends _i14.Modules {}
