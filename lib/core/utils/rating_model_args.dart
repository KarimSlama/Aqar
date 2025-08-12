class RatingModelArgs {
  final String image, fullName, comment, createdAt;
  final double rating;

  RatingModelArgs(
      {required this.image,
      required this.fullName,
      required this.comment,
      required this.createdAt,
      required this.rating});
}
