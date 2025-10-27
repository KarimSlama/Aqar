import 'package:aqar/3qar/buyer_app/home/data/repository/properties_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'search_event.dart';
import 'search_state.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) =>
      events.debounceTime(duration).switchMap(mapper);
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final PropertiesRepository propertiesRepository;

  String? _currentSearchQuery;
  double? _currentMinPrice;
  double? _currentMaxPrice;
  int? _currentNumberOfRooms;
  int? _currentNumberOfBathrooms;
  String? _currentLocation;
  String? _currentSaleType;
  int? _currentMinArea;
  int? _currentMaxArea;

  SearchBloc(this.propertiesRepository) : super(SearchInitial()) {
    on<SearchQueryChanged>(
      _onSearchQueryChanged,
      transformer: debounce(const Duration(milliseconds: 500)),
    );
    // on<SearchNearbyProperties>(_onSearchNearbyProperties);
    on<ResetSearchFilters>(_onResetSearchFilters);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    _currentSearchQuery = event.searchQuery ?? _currentSearchQuery;
    _currentMinPrice = event.minPrice ?? _currentMinPrice;
    _currentMaxPrice = event.maxPrice ?? _currentMaxPrice;
    _currentNumberOfRooms = event.numberOfRooms ?? _currentNumberOfRooms;
    _currentNumberOfBathrooms =
        event.numberOfBathrooms ?? _currentNumberOfBathrooms;
    _currentLocation = event.location ?? _currentLocation;
    _currentSaleType = event.saleType ?? _currentSaleType;
    _currentMinArea = event.minArea ?? _currentMinArea;
    _currentMaxArea = event.maxArea ?? _currentMaxArea;

    final query = _currentSearchQuery?.trim() ?? '';

    final noFiltersApplied = query.isEmpty &&
        _currentMinPrice == null &&
        _currentMaxPrice == null &&
        _currentNumberOfRooms == null &&
        _currentNumberOfBathrooms == null &&
        _currentLocation == null &&
        _currentSaleType == null &&
        _currentMinArea == null &&
        _currentMaxArea == null;

    if (noFiltersApplied) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    final result = await propertiesRepository.searchProperties(
      searchQuery: query.isEmpty ? null : query,
      minPrice: _currentMinPrice,
      maxPrice: _currentMaxPrice,
      numberOfRooms: _currentNumberOfRooms,
      numberOfBathrooms: _currentNumberOfBathrooms,
      location: _currentLocation,
      saleType: _currentSaleType,
      minArea: _currentMinArea,
      maxArea: _currentMaxArea,
    );

    result.when(
      success: (properties) {
        if (!emit.isDone) {
          if (properties.isEmpty) {
            emit(SearchEmpty());
          } else {
            emit(SearchLoaded(properties));
          }
        }
      },
      failure: (error) {
        if (!emit.isDone) {
          emit(SearchError(error));
        }
      },
    );
  }

  // Future<void> _onSearchNearbyProperties(
  //   SearchNearbyProperties event,
  //   Emitter<SearchState> emit,
  // ) async {
  //   print('📍 Searching nearby: ${event.latitude}, ${event.longitude}');
  //   emit(SearchLoading());

  //   final result = await propertiesRepository.searchPropertiesNearLocation(
  //     latitude: event.latitude,
  //     longitude: event.longitude,
  //     radiusInKm: event.radiusInKm,
  //   );

  //   result.when(
  //     success: (properties) {
  //       if (!emit.isDone) {
  //         print('✅ Found ${properties.length} nearby properties');
  //         if (properties.isEmpty) {
  //           emit(SearchEmpty());
  //         } else {
  //           final nearestProperties = properties.take(5).toList();
  //           emit(SearchLoaded(nearestProperties));
  //         }
  //       }
  //     },
  //     failure: (error) {
  //       if (!emit.isDone) {
  //         print('❌ Error: $error');
  //         emit(SearchError(error));
  //       }
  //     },
  //   );
  // }

  void _onResetSearchFilters(
    ResetSearchFilters event,
    Emitter<SearchState> emit,
  ) {

    _currentSearchQuery = null;
    _currentMinPrice = null;
    _currentMaxPrice = null;
    _currentNumberOfRooms = null;
    _currentNumberOfBathrooms = null;
    _currentLocation = null;
    _currentSaleType = null;
    _currentMinArea = null;
    _currentMaxArea = null;

    emit(SearchInitial());
  }

  Map<String, dynamic> get currentFilters => {
        'searchQuery': _currentSearchQuery,
        'minPrice': _currentMinPrice,
        'maxPrice': _currentMaxPrice,
        'numberOfRooms': _currentNumberOfRooms,
        'numberOfBathrooms': _currentNumberOfBathrooms,
        'location': _currentLocation,
        'saleType': _currentSaleType,
        'minArea': _currentMinArea,
        'maxArea': _currentMaxArea,
      };
}