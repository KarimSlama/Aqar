import 'package:aqar/core/common/widgets/get_location_address.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_sizes.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        spacing: AqarSizes.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetLocationAddress(isHeading: true, icon: Iconsax.location_copy),
          Text('Good Morning!', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Iconsax.notification),
          onPressed: () => context.pushNamed(Routes.notificationsScreen),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AqarSizes.appBarHeight);
}
