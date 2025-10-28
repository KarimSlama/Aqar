import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lottie/lottie.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Iconsax.arrow_left_2_copy),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.images.empty,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text('No notifications yet'),
          ],
        ),
      ),
    );
  }
}
