import 'package:aqar/core/common/widgets/images/cached_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/circulars/circular_container_with_shadow.dart';
import '../../../../core/common/widgets/row/title_with_icon_in_row.dart';

class PropertySearchCard extends StatelessWidget {
  final String image, propertyName, location;
  final int propertyId;
  final double price;
  const PropertySearchCard(
      {super.key,
      required this.image,
      required this.propertyName,
      required this.price,
      required this.location,
      required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return CircularContainerShadow(
      isCircularRadius: true,
      padding: 7,
      radius: 20,
      height: 70.h,
      widget: Row(
        spacing: 10.w,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: 'hero_image_tag_$propertyId',
                child: CachedImage(
                    height: 70.h, width: 80.w, fit: BoxFit.cover, image: image),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(propertyName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              TitleWithIconInRow(
                  isHeading: true, text: location, icon: Iconsax.location),
            ],
          ),
          Text('$price AED', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
