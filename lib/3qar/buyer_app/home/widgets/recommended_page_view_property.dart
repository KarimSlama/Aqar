import 'package:aqar/3qar/buyer_app/home/controller/home_cubit.dart';
import '../../row/row_icon_with_title.dart';
import 'package:aqar/core/common/widgets/images/cached_images.dart';
import 'package:aqar/core/common/widgets/loaders/recommended_property_shimmer.dart';
import 'package:aqar/core/common/widgets/separators/heigth_separators.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../controller/home_state.dart';
import '../data/model/home_enum.dart';

class RecommendedPageViewProperty extends StatelessWidget {
  const RecommendedPageViewProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.propertyStatus) {
          case HomeDataState.loading:
            return RecommendedPropertyShimmer();
          case HomeDataState.success:
            final sortedProperties = List.from(state.propertiesData)
              ..sort((a, b) => a.price.compareTo(b.price));

            final limitedProperties = sortedProperties.take(5).toList();

            return SizedBox(
              height: AqarHelperFunctions.screenHeight(context) / 2.8,
              child: PageView(
                controller: cubit.pageController,
                onPageChanged: (index) => cubit.changePageViewPage(index),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  limitedProperties.length,
                  (index) {
                    final property = limitedProperties[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Material(
                        elevation: 3,
                        color: AqarHelperFunctions.isDark(context)
                            ? AqarColors.light.withValues(alpha: .1)
                            : AqarColors.light.withValues(alpha: .9),
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AqarSizes.borderRadiusLg),
                              child: CachedImage(
                                image: property.imageUrls[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.all(
                                    AqarSizes.ms),
                                child: Column(
                                  children: [
                                    Row(
                                      spacing: AqarSizes.ms,
                                      children: [
                                        Image.network(
                                          width: 50,
                                          property.developer?.companyLogoUrl ??
                                              'https://via.placeholder.com/50x50',
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                property.location,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              Text(
                                                property.propertyName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RowIconWithTitle(
                                          icon: Icons.bed_outlined,
                                          text: '${property.numberOfBeds} Beds',
                                        ),
                                        HeightSeperator(),
                                        RowIconWithTitle(
                                          icon: Icons.shower,
                                          text:
                                              '${property.numberOfBathrooms} Bath',
                                        ),
                                        HeightSeperator(),
                                        RowIconWithTitle(
                                          icon:
                                              Iconsax.slider_horizontal_1_copy,
                                          text: '${property.area} m',
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case HomeDataState.error:
            return Text(state.errorMessage ?? 'Error units');
        }
      },
    );
  }
}
