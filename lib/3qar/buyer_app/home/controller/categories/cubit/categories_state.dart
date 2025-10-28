import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';

enum CategoryType { forSale, forRent, nearby }

sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final CategoryType selectedCategory;
  final List<PropertyDetailsModel> forSaleProperties;
  final List<PropertyDetailsModel> forRentProperties;
  final List<PropertyDetailsModel> nearbyProperties;

  CategoriesLoaded({
    required this.selectedCategory,
    this.forSaleProperties = const [],
    this.forRentProperties = const [],
    this.nearbyProperties = const [],
  });

  List<PropertyDetailsModel> getCurrentCategoryProperties() {
    switch (selectedCategory) {
      case CategoryType.forSale:
        return forSaleProperties;
      case CategoryType.forRent:
        return forRentProperties;
      case CategoryType.nearby:
        return nearbyProperties;
    }
  }
}

class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}
