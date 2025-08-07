import 'package:aqar/3qar/buyer_app/home/data/model/property_image_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/images/cached_images.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../../../core/helpers/helper_functions.dart';

class PropertyPhotos extends StatelessWidget {
  final List<PropertyImageModel> images;
  const PropertyPhotos({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AqarHelperFunctions.screenHeight(context) / 6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(end: AqarSizes.sm),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AqarSizes.borderRadiusLg),
            child: CachedImage(
              image: images[index].imageUrl,
              width: AqarHelperFunctions.screenWidth(context) / 3,
              height: AqarHelperFunctions.screenHeight(context) / 4,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
