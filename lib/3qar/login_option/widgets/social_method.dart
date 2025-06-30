import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/aqar_sizes.dart';
import '../../../gen/assets.gen.dart';

class SocialMethod extends StatelessWidget {
  const SocialMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AqarSizes.defaultSpace,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(Assets.icons.facebook)),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(Assets.icons.google)),
      ],
    );
  }
}
