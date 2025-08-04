import 'package:flutter/material.dart';

import '../../../constants/aqar_colors.dart';

class HeightSeperator extends StatelessWidget {
  const HeightSeperator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 30,
      color: AqarColors.light,
    );
  }
}
