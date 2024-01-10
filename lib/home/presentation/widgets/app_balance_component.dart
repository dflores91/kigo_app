import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kigo_app/app/presentation/theme/colors.dart';
import 'package:kigo_app/app/presentation/theme/typography.dart';

class AppBalanceComponent extends StatelessWidget {
  const AppBalanceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268,
      height: 66,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset('images/svg/flag.svg'),
                  const Icon(Icons.keyboard_arrow_down_sharp),
                ],
              ),
              Text('Cambiar país',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.robotoMedium10),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('images/svg/credit-card.svg'),
              Text('Tarjeta activa',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.robotoMedium10),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('images/svg/wallet.svg'),
              Text('-\$128.00',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.robotoMedium10.orange),
            ],
          )
        ],
      ),
    );
  }
}
