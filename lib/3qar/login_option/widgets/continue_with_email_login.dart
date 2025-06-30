import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/constants/aqar_colors.dart';
import '../../../core/constants/aqar_sizes.dart';
import '../../../core/constants/aqar_string.dart';

class ContinueWithEmailLogin extends StatelessWidget {
  const ContinueWithEmailLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AqarSizes.ms,
        children: [
          Icon(Iconsax.sms_copy, color: AqarColors.white),
          Text(AqarString.continueWithEmail),
        ],
      ),
    );
  }
}
