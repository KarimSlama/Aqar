import 'package:aqar/3qar/buyer_app/home/data/model/property_image_model.dart';
import 'package:aqar/core/common/widgets/images/cached_images.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PropertyImagesBottomSheet extends StatefulWidget {
  final List<PropertyImageModel> images;
  final String? propertyName;

  const PropertyImagesBottomSheet({
    super.key,
    required this.images,
    this.propertyName,
  });

  @override
  State<PropertyImagesBottomSheet> createState() =>
      _PropertyImagesBottomSheetState();
}

class _PropertyImagesBottomSheetState extends State<PropertyImagesBottomSheet> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: AqarHelperFunctions.isDark(context)
            ? AqarColors.black
            : AqarColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 10.w,
              children: [
                const Icon(Iconsax.gallery),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.propertyName!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${_currentPage + 1} from ${widget.images.length}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Iconsax.close_circle),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Image PageView
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedImage(
                      image: widget.images[index].imageUrl,
                    ),
                  ),
                );
              },
            ),
          ),
          // Dots Indicator
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
