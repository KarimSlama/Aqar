import 'package:flutter/material.dart';

import '../../../constants/aqar_sizes.dart';

class DeveloperLogoWithLocationAndPropertyNameRow extends StatelessWidget {
  final String logo, propertyLocation, propertyName;
  final Widget? child;
  const DeveloperLogoWithLocationAndPropertyNameRow({
    super.key,
    this.child,
    required this.logo,
    required this.propertyLocation,
    required this.propertyName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AqarSizes.ms,
      children: [
        Image.network(width: 50, logo),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                propertyLocation,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                propertyName,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(child: child),
      ],
    );
  }
}
