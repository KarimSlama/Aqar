import 'package:flutter/material.dart';

import '../../../constants/aqar_sizes.dart';

class DeveloperLogoWithLocationAndPropertyNameRow extends StatelessWidget {
  final String logo, propertyLocation, propertyName;
  final Widget? child;
  final bool isRow;
  const DeveloperLogoWithLocationAndPropertyNameRow({
    super.key,
    this.child,
    required this.logo,
    required this.propertyLocation,
    required this.propertyName,
    this.isRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return isRow
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AqarSizes.ms,
            children: [
              Row(
                spacing: AqarSizes.sm,
                children: [
                  Image.network(width: 50, logo),
                  Flexible(
                    child: Text(
                      propertyLocation,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              Text(
                propertyName,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (child != null) child!,
            ],
          )
        : Row(
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
