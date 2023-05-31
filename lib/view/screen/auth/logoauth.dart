import 'package:flutter/material.dart';

import '../../../core/constant/imagesasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
      AppImageAsset.logo,
      height: 200,
    ));
  }
}
