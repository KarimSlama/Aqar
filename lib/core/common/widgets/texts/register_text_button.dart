import 'package:aqar/core/common/widgets/texts/text_span.dart';
import 'package:flutter/material.dart';

import '../../../constants/aqar_string.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpanText(
        text: AqarString.dontHaveAnAccount,
        actionText: AqarString.register,
        actionTextOnTap: () {},
      ),
    );
  }
}
