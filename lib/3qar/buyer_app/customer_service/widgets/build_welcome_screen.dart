import 'package:aqar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget buildWelcomeScreen() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Assets.images.chatbot),
        Text('How can we help you today?'),
      ],
    ),
  );
}
