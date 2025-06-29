import '../../../core/constants/aqar_string.dart';
import '../../../gen/assets.gen.dart';

class BoardingModel {
  final String image;
  final String title;
  final String actionText;
  final String? actionText2;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.actionText,
    required this.body,
    this.actionText2,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
    image: Assets.images.house.path,
    title: AqarString.findBestPlaceToStayIn,
    actionText: AqarString.goodPrice,
    body: AqarString.discoverAffordableHomesTailoredToYourNeeds,
  ),
  BoardingModel(
    image: Assets.images.house2.path,
    title: AqarString.fastSellYourPropertyInJust,
    actionText: AqarString.oneClick,
    body: AqarString.listYourPropertyEasilyAndReachSeriousBuyersInSeconds,
  ),
  BoardingModel(
    image: Assets.images.house3.path,
    title: AqarString.find,
    actionText: AqarString.perfectChoice,
    actionText2: AqarString.forYourFutureHouse,
    body: AqarString.exploreTopRatedHomesThatMatchYourLifestyleAndBudget,
  ),
];
