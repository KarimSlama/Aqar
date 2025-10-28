import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/property_card.dart';
import 'package:aqar/core/common/widgets/app_bar/main_app_bar.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RecommendedForYouAllPropertiesScreen extends StatefulWidget {
  final List<PropertyDetailsModel> properties;
  const RecommendedForYouAllPropertiesScreen(
      {super.key, required this.properties});

  @override
  State<RecommendedForYouAllPropertiesScreen> createState() =>
      _RecommendedForYouAllPropertiesScreenState();
}

class _RecommendedForYouAllPropertiesScreenState
    extends State<RecommendedForYouAllPropertiesScreen> {
  late final _pagingController = PagingController<int, dynamic>(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => widget.properties,
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAqarAppBar(title: 'All Properties'),
      body: Padding(
        padding: const EdgeInsets.all(AqarSizes.ms),
        child: PagingListener(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) => ListView.builder(
            itemCount: widget.properties.length,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.only(bottom: AqarSizes.ms),
              child: PropertyCard(property: widget.properties[index]),
            ),
          ),
        ),
      ),
    );
  }
}
