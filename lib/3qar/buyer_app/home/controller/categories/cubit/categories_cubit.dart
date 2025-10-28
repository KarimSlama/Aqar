import 'package:aqar/3qar/buyer_app/home/controller/categories/cubit/categories_state.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/repository/properties_repository.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final PropertiesRepository propertiesRepository;
  CategoryType? _selectedCategory;
  List<PropertyDetailsModel> _forSaleProperties = [];
  List<PropertyDetailsModel> _forRentProperties = [];
  List<PropertyDetailsModel> _nearbyProperties = [];

  CategoriesCubit(this.propertiesRepository) : super(CategoriesInitial()) {
    // Initialize with Nearby category by default
    selectCategory(CategoryType.nearby);
  }

  void selectCategory(CategoryType category) {
    _selectedCategory = category;
    _emitLoadedState();

    // Fetch properties if not already loaded
    switch (category) {
      case CategoryType.forSale:
        if (_forSaleProperties.isEmpty) {
          _fetchForSaleProperties();
        }
        break;
      case CategoryType.forRent:
        if (_forRentProperties.isEmpty) {
          _fetchForRentProperties();
        }
        break;
      case CategoryType.nearby:
        if (_nearbyProperties.isEmpty) {
          _fetchNearbyProperties();
        }
        break;
    }
  }

  void _fetchForSaleProperties() async {
    emit(CategoriesLoading());
    final result = await propertiesRepository.searchProperties(
      saleType: AqarString.forSale,
    );

    result.when(
      success: (properties) {
        _forSaleProperties = properties.take(4).toList();
        _emitLoadedState();
      },
      failure: (error) {
        emit(CategoriesError(error));
      },
    );
  }

  void _fetchForRentProperties() async {
    emit(CategoriesLoading());
    final result = await propertiesRepository.searchProperties(
      saleType: AqarString.forRent,
    );

    result.when(
      success: (properties) {
        _forRentProperties = properties.take(4).toList();
        _emitLoadedState();
      },
      failure: (error) {
        emit(CategoriesError(error));
      },
    );
  }

  void _fetchNearbyProperties() async {
    emit(CategoriesLoading());
    // For now, fetch all properties as nearby
    // Later you can implement location-based filtering
    final result = await propertiesRepository.fetchProperties();

    result.when(
      success: (properties) {
        _nearbyProperties = properties.take(4).toList();
        _emitLoadedState();
      },
      failure: (error) {
        emit(CategoriesError(error));
      },
    );
  }

  void clearSelection() {
    _selectedCategory = null;
    emit(CategoriesInitial());
  }

  void _emitLoadedState() {
    if (_selectedCategory != null) {
      emit(CategoriesLoaded(
        selectedCategory: _selectedCategory!,
        forSaleProperties: _forSaleProperties,
        forRentProperties: _forRentProperties,
        nearbyProperties: _nearbyProperties,
      ));
    }
  }

  Future<List<PropertyDetailsModel>> getAllPropertiesForCategory(
      CategoryType category) async {
    switch (category) {
      case CategoryType.forSale:
        // Always fetch all properties, not just the cached 4
        final result = await propertiesRepository.searchProperties(
          saleType: AqarString.forSale,
        );
        return result.when(
          success: (properties) => properties,
          failure: (_) => [],
        );
      case CategoryType.forRent:
        final result = await propertiesRepository.searchProperties(
          saleType: AqarString.forRent,
        );
        return result.when(
          success: (properties) => properties,
          failure: (_) => [],
        );
      case CategoryType.nearby:
        final result = await propertiesRepository.fetchProperties();
        return result.when(
          success: (properties) => properties,
          failure: (_) => [],
        );
    }
  }

  List<PropertyDetailsModel> getCurrentLoadedProperties() {
    if (_selectedCategory == null) return [];
    switch (_selectedCategory) {
      case CategoryType.forSale:
        return _forSaleProperties;
      case CategoryType.forRent:
        return _forRentProperties;
      case CategoryType.nearby:
        return _nearbyProperties;
      case null:
        return [];
    }
  }
}
