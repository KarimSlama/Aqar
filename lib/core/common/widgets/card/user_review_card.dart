import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/rating_model_args.dart';
import '../container/rounded_container.dart';
import '../properties/aqar_rating_bar_indicator.dart';
import '../texts/read_more_texts.dart';
import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';
import '../../../helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  final RatingModelArgs ratings;
  final bool isOwnerReplied;
  const UserReviewCard(
      {super.key, required this.ratings, this.isOwnerReplied = false});

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
                CircleAvatar(backgroundImage: NetworkImage(ratings.image)),
                Text(ratings.fullName,
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.more_circle_copy))
          ],
        ),
        Row(
          spacing: AqarSizes.spaceBtwItems,
          children: [
            AqarRatingBarIndicator(rating: ratings.rating),
            Text(AqarHelperFunctions.formatDateTime(ratings.createdAt),
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        AqarReadMoreText(text: ratings.comment, lines: 3),
        isOwnerReplied
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
                    AqarReadMoreText(text: '', lines: 2)
                  ],
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
