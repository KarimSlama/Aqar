import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/core/common/widgets/icons/map_icon.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/row/developer_logo_with_location_and_property_name_row.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../core/constants/aqar_sizes.dart';
import 'luxury_property_details.dart';
import 'property_payment_plans.dart';

class PropertyDetailsBottomSheet extends StatelessWidget {
  final PropertyDetailsModel property;
  const PropertyDetailsBottomSheet({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: AqarSizes.md, vertical: 12.h),
      child: Column(
        spacing: AqarSizes.md,
        children: [
          DeveloperLogoWithLocationAndPropertyNameRow(
              logo: property.developer!.companyLogoUrl!,
              propertyLocation: property.location,
              propertyName: property.propertyName,
              child: MapIcon(latitude: property.latitude, longitude: property.longitude)),
          SectionHeading(
              text: AqarString.luxuryProperty, isActionButton: false),
          LuxuryPropertyDetails(
            referenceNo: property.referenceNumber ?? '',
            noOfBathroom: property.numberOfBathrooms ?? 0,
            noOfBedrooms: property.numberOfBeds ?? 0,
            deliveryInYear: property.deliveryInYear ?? 0,
            saleType: property.saleType ?? '',
            finishing: property.finishing ?? '',
          ),
          SectionHeading(text: AqarString.paymentPlans, isActionButton: false),
          PropertyPaymentPlans(
            price: property.price,
            downPayment: property.downPayment!.toDouble(),
            installmentPeriodYears: property.installmentPeriodYears ?? 0,
          ),
        ],
      ),
    );
  }
}
