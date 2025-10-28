import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/circulars/circular_container_with_shadow.dart';
import '../../../../core/common/widgets/images/cached_images.dart';
import '../../../../core/common/widgets/loaders/aqar_shimmer.dart';
import '../../../../core/helpers/helper_functions.dart';
import '../../profile/controller/profile/profile_cubit.dart';
import '../../profile/controller/profile/profile_state.dart';
import '../../profile/data/model/profile_enum.dart';

class ProfileImageWithEditIcon extends StatelessWidget {
  final String image;
  const ProfileImageWithEditIcon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.profileDataStatus == ProfileDataState.loading) {
          return const Center(
            child: AqarShimmerEffect(height: 150, width: 150),
          );
        }

        return FadeIn(
          curve: Curves.bounceInOut,
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: CachedImage(
                      height: 150, width: 150, fit: BoxFit.cover, image: image),
                ),
                CircularContainerShadow(
                    width: AqarHelperFunctions.screenWidth(context) / 8,
                    height: AqarHelperFunctions.screenHeight(context) / 20,
                    widget: IconButton(
                        onPressed: () => context
                            .read<ProfileCubit>()
                            .updateUserProfilePicture(),
                        icon: Icon(Iconsax.edit_2))),
              ],
            ),
          ),
        );
      },
    );
  }
}
