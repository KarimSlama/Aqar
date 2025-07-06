import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../constants/aqar_colors.dart';

class Loaders {
  static void successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Iconsax.check, color: AqarColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(color: AqarColors.white)),
                  if (message.isNotEmpty)
                    Text(message,
                        style: const TextStyle(color: AqarColors.white)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AqarColors.darkBlue,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static void warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Iconsax.warning_2, color: AqarColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(color: AqarColors.white)),
                  if (message.isNotEmpty)
                    Text(message,
                        style: const TextStyle(color: AqarColors.white)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AqarColors.orange,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static void errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Iconsax.warning_2, color: AqarColors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(color: AqarColors.white)),
                  if (message.isNotEmpty)
                    Text(message,
                        style: const TextStyle(color: AqarColors.white)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AqarColors.red,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
