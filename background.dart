import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class backgroundclr_screen extends StatelessWidget {
  const backgroundclr_screen({super.key, required this.Logo});
  final Widget Logo;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          SvgPicture.asset(
            'assets/images/app_background.svg',
            width: double.infinity,
            height: double.infinity,
          ),
          Logo,
        ],

      );

  }
}
