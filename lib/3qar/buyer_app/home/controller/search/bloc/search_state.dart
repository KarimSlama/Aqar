import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {
  SearchInitial();
}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<PropertyDetailsModel> properties;
  SearchLoaded(this.properties);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

class SearchEmpty extends SearchState {}
