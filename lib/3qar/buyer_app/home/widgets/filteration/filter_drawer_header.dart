import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FilterDrawerHeader extends StatelessWidget {
  final VoidCallback onApply;
  final VoidCallback onReset;

  const FilterDrawerHeader({
    super.key,
    required this.onApply,
    required this.onReset,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AqarColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: onReset,
                icon: Icon(Iconsax.refresh, color: Colors.white, size: 18),
                label: Text(
                  'reset all filters',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              OutlinedButton(
                  onPressed: onApply,
                  child: Text(
                    'Apply',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: Colors.white),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
