import 'package:aqar/3qar/buyer_app/home/controller/home/home_cubit.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../home/widgets/property_card.dart';

class RecentPropertiesRelatedToCurrentUser extends StatelessWidget {
  final String id;
  const RecentPropertiesRelatedToCurrentUser({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final propertiesList = context.read<HomeCubit>().propertiesList;
    final properties =
        propertiesList.where((property) => property.ownerId == id).toList();
    return Column(
      spacing: AqarSizes.spaceBtwItems,
      children: [
        SectionHeading(
            text: AqarString.recentProperties, isActionButton: false),
        properties.isEmpty
            ? Text(AqarString.noPropertiesPosted)
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (properties.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final int firstCardIndex = index * 2;
                  final int secondCardIndex = firstCardIndex + 1;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: PropertyCard(
                            property: properties[firstCardIndex],
                            isFavNeeded: false,
                            isDisplayedInRow: true,
                          ),
                        ),
                        const SizedBox(width: AqarSizes.sm),
                        if (secondCardIndex < properties.length)
                          Expanded(
                            child: PropertyCard(
                              property: properties[secondCardIndex],
                              isFavNeeded: false,
                              isDisplayedInRow: true,
                            ),
                          )
                        else
                          Expanded(child: const SizedBox.shrink()),
                      ],
                    ),
                  );
                },
              ),
      ],
    );
  }
}
