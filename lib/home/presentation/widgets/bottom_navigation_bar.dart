import 'package:flutter/material.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/home/presentation/widgets/button_menu.dart';

class AppBottomNavigatorBar extends StatelessWidget {
  const AppBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButtonMenu(
                  svgPath: 'images/svg/maps-menu.svg', label: 'Mapas'),
              AppButtonMenu(
                  svgPath: 'images/svg/control-menu.svg', label: 'Control'),
              AppButtonMenu(
                svgPath: 'images/svg/qr-menu.svg',
                label: 'QR',
                isSelected: true,
              ),
              AppButtonMenu(
                  svgPath: 'images/svg/service-menu.svg', label: 'Servicios'),
              AppButtonMenu(
                  svgPath: 'images/svg/profile-menu.svg', label: 'Perfil'),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
