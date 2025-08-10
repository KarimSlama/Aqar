class FavoriteServiceException implements Exception {
  final String message;
  FavoriteServiceException(this.message);
  @override
  String toString() => message;
}
