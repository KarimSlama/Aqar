import '../model/property_ratings_summary_model.dart';

abstract class RatingService {
  Future<PropertyRatingsSummaryModel> getPropertiesRatingsSummary(
      int propertyId);
}
