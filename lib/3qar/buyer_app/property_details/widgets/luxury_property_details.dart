import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/texts/property_text_with_definition.dart';

class LuxuryPropertyDetails extends StatelessWidget {
  final int noOfBathroom, noOfBedrooms, deliveryInYear;

  final String referenceNo, saleType, finishing;

  const LuxuryPropertyDetails({
    super.key,
    required this.noOfBathroom,
    required this.noOfBedrooms,
    required this.finishing,
    required this.saleType,
    required this.deliveryInYear,
    required this.referenceNo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PropertyTextWithDefinition(
          text: AqarString.referenceNo,
          definition: referenceNo,
        ),
        PropertyTextWithDefinition(
          text: AqarString.bedroomsNo,
          definition: '$noOfBedrooms',
        ),
        PropertyTextWithDefinition(
          text: AqarString.bathroomsNo,
          definition: '$noOfBathroom',
        ),
        PropertyTextWithDefinition(
          text: AqarString.deliveryIn,
          definition: '$deliveryInYear',
        ),
        PropertyTextWithDefinition(
          text: AqarString.saleType,
          definition: saleType,
        ),
        PropertyTextWithDefinition(
          text: AqarString.finishing,
          definition: finishing,
        ),
      ],
    );
  }
}
