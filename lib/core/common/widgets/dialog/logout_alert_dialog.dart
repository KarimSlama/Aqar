import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class LogoutAccountAlertDialog extends StatelessWidget {
  final VoidCallback onPressed;
  const LogoutAccountAlertDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Logout ?"),
      content: Text(
          "Are you sure you want to logout from your account permanently? This action is not revisible and all of your data will be removed permanently"),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AqarColors.red,
            side: BorderSide(color: AqarColors.red),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
            child: Text('Delete'),
          ),
        ),
      ],
    );
  }
}
