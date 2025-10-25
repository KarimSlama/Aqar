import 'package:aqar/3qar/buyer_app/property_details/data/model/property_args.dart';
import 'package:aqar/core/common/widgets/circulars/circular_container_with_shadow.dart';
import 'package:aqar/core/common/widgets/images/cached_images.dart';
import 'package:aqar/core/common/widgets/texts/section_heading.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../core/common/widgets/app_bar/main_app_bar.dart';
import 'widgets/icons_heading_with_text_and_price_in_month.dart';
import 'widgets/property_details_bottom_sheet.dart';
import 'widgets/property_features_details.dart';
import 'widgets/property_name_with_location_and_map_icon.dart';
import 'widgets/property_photos.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final PropertyArgs args;
  const PropertyDetailsScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAqarAppBar(title: args.property.propertyName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AqarSizes.ms, vertical: AqarSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AqarSizes.lg,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Hero(
                        tag: args.imageTag,
                        child: CachedImage(
                            height:
                                AqarHelperFunctions.screenHeight(context) / 3.4,
                            fit: BoxFit.cover,
                            image: args.property.propertyImages[0].imageUrl),
                      )),
                  IconsHeadingWithTextAndPriceInMonth(
                    rating: '${args.property.averageRating}',
                    propertyId: args.property.id!,
                    installment:
                        AqarHelperFunctions.calculateMonthlyInstallment(
                            args.property.price,
                            args.property.downPayment!.toDouble(),
                            args.property.installmentPeriodYears!.toInt()),
                    ratingCount: args.property.totalReviewsCount ?? 0,
                    overalRating: args.property.averageRating ?? 0.0,
                  ),
                ],
              ),
              PropertyNameWithLocationAndMapIcon(
                  propertyName: args.property.propertyName,
                  location: args.property.location,
                  latitude: args.property.latitude ?? 0.0,
                  longitude: args.property.longitude ?? 0.0,
                  ),
              SectionHeading(
                  text: '${AqarString.price}: ${args.property.price} AED',
                  isActionButton: false),
              Wrap(
                children: List.generate(args.property.propertyFeatures.length,
                    (index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: AqarSizes.sm),
                    child: CircularContainerShadow(
                        padding: AqarSizes.md,
                        widget: Text(
                            args.property.propertyFeatures[index].feature)),
                  );
                }),
              ),
              SectionHeading(
                  text: AqarString.propertyPhotos, isActionButton: false),
              PropertyPhotos(images: args.property.propertyImages),
              SectionHeading(
                text: AqarString.aboutProperty,
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      PropertyDetailsBottomSheet(property: args.property),
                ),
              ),
              Text(args.property.description,
                  style: Theme.of(context).textTheme.bodyLarge!),
              SectionHeading(
                  text: AqarString.propertyDetails, isActionButton: false),
              PropertyFeaturesDetails(
                noOfBathroom: args.property.numberOfBathrooms ?? 0,
                noOfBedrooms: args.property.numberOfBeds ?? 0,
                noOfLivingRoom: args.property.numberOfLivingRooms ?? 0,
                area: args.property.area ?? 0,
                buildInYear: args.property.builtInYear ?? 0,
                garageForCars: args.property.garageForCars ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
