import 'package:aqar/3qar/buyer_app/property_rating/data/model/property_ratings_summary_model.dart';
import 'package:aqar/3qar/buyer_app/property_rating/data/network/rating_service.dart';
import 'package:aqar/core/network/server_result.dart';

class RatingRepository {
  final RatingService ratingService;
  const RatingRepository(this.ratingService);

  Future<ServerResult<PropertyRatingsSummaryModel>> getPropertiesRatingsSummary(
      int propertyId) async {
    try {
      final response =
          await ratingService.getPropertiesRatingsSummary(propertyId);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
