import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/property_ratings_summary_model.dart';
import 'rating_service.dart';

class RatingServiceImpl implements RatingService {
  final supabase = Supabase.instance.client;

  @override
  Future<PropertyRatingsSummaryModel> getPropertiesRatingsSummary(
      int propertyId) async {
    try {
      final response = await supabase.rpc(
        'get_property_ratings_summary',
        params: {'property_id_param': propertyId},
      ) as List;

      if (response.isEmpty) {
        return const PropertyRatingsSummaryModel(
            reviews: [], averageRating: 0.0, totalReviewsCount: 0);
      }

      final firstResponseItem = response.first as Map<String, dynamic>;
      return PropertyRatingsSummaryModel.fromJson(firstResponseItem);
    } catch (error) {
      return const PropertyRatingsSummaryModel(
          reviews: [], averageRating: 0.0, totalReviewsCount: 0);
    }
  }
}
