import 'package:aqar/3qar/buyer_app/home/controller/search/bloc/search_state.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/property_search_card.dart';
import 'package:aqar/3qar/buyer_app/property_details/data/model/property_args.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../controller/search/bloc/search_bloc.dart';

class ListOfSearchedProperties extends StatelessWidget {
  const ListOfSearchedProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state) {
          case SearchLoading():
            return SpinKitSpinningLines(color: AqarColors.gold);
          case SearchLoaded():
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.properties.length,
              itemBuilder: (context, index) {
                final property = state.properties[index];
                return GestureDetector(
                  onTap: () => context.pushNamed(Routes.propertyDetailsScreen,
                      arguments: PropertyArgs(
                          property: property,
                          imageTag: 'hero_image_tag_${property.id}')),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: PropertySearchCard(
                      image: property.propertyImages[0].imageUrl,
                      propertyName: property.propertyName,
                      price: property.price,
                      propertyId: property.id!,
                      location: property.location,
                    ),
                  ),
                );
              },
            );
          case SearchError():
            return Center(child: Text('Error: ${state.message}'));

          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
