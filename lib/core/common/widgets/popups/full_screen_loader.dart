import 'package:flutter/material.dart';
import '../../../constants/aqar_colors.dart';
import '../../../helpers/helper_functions.dart';
import '../loaders/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation, context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AqarHelperFunctions.isDark(context)
              ? AqarColors.black
              : AqarColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 250),
              AnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading(context) {
    Navigator.pop(context);
  }
}
