

import 'package:flutter/material.dart';
import 'package:school_management_system/core/constants/image_asset.dart';

class AppbarImage extends StatelessWidget {
  const AppbarImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 67.4,
      left: 64.13,
      child: Image.asset(
        APPImageAsset.appbarImage,
        width: 294.59,
        height: 131.36,
      ),
    );
  }
}