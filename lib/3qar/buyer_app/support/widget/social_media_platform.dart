import 'package:aqar/core/common/widgets/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaPlatform extends StatelessWidget {
  final String icon;
  final String platformName;
  final VoidCallback onTapped;

  const SocialMediaPlatform(
      {super.key,
      required this.icon,
      required this.platformName,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // onTapped();
        Loaders.successSnackBar(
            context: context, title: 'Coming Soon, still in development');
      },
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 7, horizontal: 14),
        child: Material(
          elevation: 1,
          borderRadius: BorderRadiusDirectional.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              spacing: 14,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 30,
                ),
                Text(platformName)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
