import 'package:flutter/material.dart';
import '../../../../core/constants/aqar_string.dart';
import '../../../../gen/assets.gen.dart';
import 'social_media_platform.dart';

class FacebookUrlWidget extends StatelessWidget {

  const FacebookUrlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialMediaPlatform(
        icon: Assets.icons.facebook,
        platformName: AqarString.facebook,
        onTapped: () {
          // openFacebookPage();
        });
  }
}
