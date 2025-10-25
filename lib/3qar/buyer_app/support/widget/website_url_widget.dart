import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/aqar_string.dart';
import '../../../../gen/assets.gen.dart';
import 'social_media_platform.dart';

class WebsiteUrlWidget extends StatelessWidget {
  final String websiteUrl = 'https://english-secrets.com/';

  Future<void> openWebsite() async {
    final Uri url = Uri.parse(websiteUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $websiteUrl';
    }
  }

  const WebsiteUrlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialMediaPlatform(
        icon: Assets.icons.google,
        platformName: AqarString.link,
        onTapped: () async {
          await openWebsite();
        });
  }
}
