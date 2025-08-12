import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../circulars/circular_container_with_shadow.dart';

class SettingsMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: CircularContainerShadow(padding: 7, widget: Icon(icon)),
        title: Text(title, style: Theme.of(context).textTheme.titleSmall!),
        trailing: trailing ?? Icon(Iconsax.arrow_right_3_copy),
      ),
    );
  }
}
