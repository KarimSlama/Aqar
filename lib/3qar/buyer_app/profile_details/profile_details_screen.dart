import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/constants/aqar_colors.dart';
import '../../../core/helpers/helper_functions.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Details'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Iconsax.arrow_left_2_copy,
            color: AqarHelperFunctions.isDark(context)
                ? AqarColors.white
                : AqarColors.black,
          ),
        ),
      ),
    );
  }
}
