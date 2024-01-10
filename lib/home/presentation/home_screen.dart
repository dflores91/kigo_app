import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';
import 'package:kigo_app/home/presentation/widgets/app_balance_component.dart';
import 'package:kigo_app/home/presentation/widgets/app_qr_button.dart';
import 'package:kigo_app/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:kigo_app/home/presentation/widgets/app_parking_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/png/kigo-totem-camara.png',
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'images/svg/notification.svg',
                  ),
                  SvgPicture.asset(
                    'images/svg/logo-kigo-white.svg',
                    height: 36,
                    width: 125,
                  ),
                  SvgPicture.asset(
                    'images/svg/whatsapp.svg',
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Escanea el código QR',
                textAlign: TextAlign.center,
                style: TypographyStyle.robotoSemiBold16.w700.white,
              ),
              const SizedBox(
                height: 35,
              ),
              Center(
                child: Container(
                  width: 262,
                  height: 262,
                  decoration: BoxDecoration(color: white.withOpacity(0.1)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppQrButton(
                    buttonText: 'Escanear QR',
                    svgPath: 'images/svg/scan-qr.svg',
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  AppQrButton(
                      buttonText: 'Mostrar mi QR',
                      svgPath: 'images/svg/show-qr.svg')
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const AppBalanceComponent(),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppParkingbutton(
                    buttonText: 'Parquímetro',
                    svgPath: 'images/svg/image-parkimovil.svg',
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  AppParkingbutton(
                    buttonText: 'Estatus',
                    svgPath: 'images/svg/image-crono.svg',
                  )
                ],
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigatorBar(),
    );
  }
}
