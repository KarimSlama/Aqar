import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../home/widgets/property_card.dart';
import '../../profile/data/model/profile_args.dart';

class RecentPropertiesRelatedToCurrentUser extends StatelessWidget {
  final ProfileArgs profileArgs;
  const RecentPropertiesRelatedToCurrentUser(
      {super.key, required this.profileArgs});

  @override
  Widget build(BuildContext context) {
    final propertiesList = profileArgs.homeCubit.propertiesList;
    final properties = propertiesList
        .where((property) => property.ownerId == profileArgs.user.id)
        .toList();
    return BlocProvider.value(
      value: profileArgs.homeCubit,
      child: Column(
        children: [
          SectionHeading(text: 'Recent Properties', isActionButton: false),
          properties.isEmpty
              ? Text('No Properties Posted')
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
      ),
    );
  }
}
