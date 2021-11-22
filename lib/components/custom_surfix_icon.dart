import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
     this.svgIcon,
     this.size,
  });

  final String svgIcon;
  final int size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0, 0, 10, 0,
        // getProportionateScreenWidth(20),
        // getProportionateScreenWidth(20),
        // getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: size.toDouble(),
      ),
    );
  }
}
