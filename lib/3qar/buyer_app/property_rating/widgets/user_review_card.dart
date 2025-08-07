import 'package:aqar/3qar/buyer_app/property_rating/data/model/rating_model.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/container/rounded_container.dart';
import '../../../../core/common/widgets/properties/aqar_rating_bar_indicator.dart';
import '../../../../core/common/widgets/texts/read_more_texts.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../../../core/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  final List<RatingModel> ratings;
  final int index;
  final bool isPropertyOwnerReplied;
  const UserReviewCard(
      {super.key,
      required this.ratings,
      required this.index,
      required this.isPropertyOwnerReplied});

  @override
  Widget build(BuildContext context) {
    final dark = AqarHelperFunctions.isDark(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AqarSizes.spaceBtwItems,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: AqarSizes.spaceBtwItems,
              children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(ratings[index].user!.image!)),
                Text(ratings[index].user!.fullName,
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.more_circle_copy))
          ],
        ),
        Row(
          spacing: AqarSizes.spaceBtwItems,
          children: [
            AqarRatingBarIndicator(rating: ratings[index].rating),
            Text(AqarHelperFunctions.formatDateTime(ratings[index].createdAt!),
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        AqarReadMoreText(text: ratings[index].comment!, lines: 3),
        isPropertyOwnerReplied
            ? RoundedContainer(
                bgColor: dark ? AqarColors.darkGrey : AqarColors.light,
                padding: EdgeInsetsDirectional.all(AqarSizes.md),
                isText: false,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AqarString.appTitle,
                            style: Theme.of(context).textTheme.titleMedium),
                        Text('26 Feb, 2025',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    AqarReadMoreText(
                        text:
                            'We truly appreciate your continuous support and trust in us. Your 5-star review brightens our day and serves as a constant reminder of why we love what we do.',
                        lines: 2)
                  ],
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
