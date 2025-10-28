import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../helpers/helper_functions.dart';
import '../loaders/recommended_property_shimmer.dart';

class CachedImage extends StatelessWidget {
  final String image;
  final double? height, width;
  final BoxFit? fit;
  const CachedImage(
      {super.key, required this.image, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    const key = "CUSTOM_CACHE_KEY";

    return CachedNetworkImage(
      imageUrl: image,
      height: height ?? AqarHelperFunctions.screenHeight(context) / 4.8,
      width: width ?? double.infinity,
      fit: fit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) =>
          RecommendedPropertyShimmer(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      cacheManager: CacheManager(
        Config(
          key,
          stalePeriod: const Duration(days: 7),
          maxNrOfCacheObjects: 20,
          repo: JsonCacheInfoRepository(databaseName: key),
          fileSystem: IOFileSystem(key),
          fileService: HttpFileService(),
        ),
      ),
    );
  }
}
