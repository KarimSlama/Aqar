sealed class SearchEvent {}

class SearchQueryChanged extends SearchEvent {
  final String? searchQuery;
  final double? minPrice;
  final double? maxPrice;
  final int? numberOfRooms;
  final int? numberOfBathrooms;
  final String? location;
  final String? saleType;
  final int? minArea;
  final int? maxArea;

  SearchQueryChanged({
    this.searchQuery,
    this.minPrice,
    this.maxPrice,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.location,
    this.saleType,
    this.minArea,
    this.maxArea,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchQueryChanged && other.searchQuery == searchQuery;
  }

  @override
  int get hashCode => searchQuery.hashCode;
}

class SearchNearbyProperties extends SearchEvent {
  final double latitude;
  final double longitude;
  final double radiusInKm;

  SearchNearbyProperties({
    required this.latitude,
    required this.longitude,
    this.radiusInKm = 5.0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchNearbyProperties &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.radiusInKm == radiusInKm;
  }

  @override
  int get hashCode => Object.hash(latitude, longitude, radiusInKm);
}

class ResetSearchFilters extends SearchEvent {
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ResetSearchFilters;

  @override
  int get hashCode => 0;
}
