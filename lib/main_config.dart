import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kigo_app/app/aplication/auth/auth_cubit.dart';
import 'package:kigo_app/app/aplication/config/injectable.dart';
import 'package:kigo_app/app/domain/flavors/flavor_config.dart';
import 'package:kigo_app/app/presentation/router/root_router.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';

Future<void> mainConfig(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(environment);
  await getIt<FlavorConfig>().initializeEnvironment();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => getIt.get<AuthCubit>()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: orange),
                  useMaterial3: true,
                ),
                home: child,
                localizationsDelegates: [
                  FlutterI18nDelegate(
                    translationLoader: FileTranslationLoader(
                      fallbackFile: 'es',
                      decodeStrategies: [YamlDecodeStrategy()],
                    ),
                  ),
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: const [Locale("es"), Locale("en")],
              ),
          child: const RootRouter()),
    );
  }
}
