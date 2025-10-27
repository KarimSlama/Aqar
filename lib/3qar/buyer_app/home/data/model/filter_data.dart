class FilterData {
  double? minPrice;
  double? maxPrice;
  int? minArea;
  int? maxArea;
  int? numberOfRooms;
  int? numberOfBathrooms;
  String? location;
  String? saleType;

  FilterData({
    this.minPrice,
    this.maxPrice,
    this.minArea,
    this.maxArea,
    this.numberOfRooms,
    this.numberOfBathrooms,
    this.location,
    this.saleType,
  });

  void clear() {
    minPrice = null;
    maxPrice = null;
    minArea = null;
    maxArea = null;
    numberOfRooms = null;
    numberOfBathrooms = null;
    location = null;
    saleType = null;
  }
}
