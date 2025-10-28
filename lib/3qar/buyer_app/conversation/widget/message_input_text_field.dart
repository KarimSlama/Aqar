import 'package:flutter/material.dart';

import '../../../../core/common/widgets/inputs/aqar_input_text_field.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../../../core/constants/aqar_string.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField({
    super.key,
    required TextEditingController messageController,
    required this.onSendPressed,
  }) : _messageController = messageController;

  final TextEditingController _messageController;
  final VoidCallback onSendPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: AqarSizes.ms,
        right: AqarSizes.ms,
      ),
      child: SizedBox(
        height: 60,
        child: AqarBarInputField(
          controller: _messageController,
          isClicked: true,
          onSendPressed: onSendPressed,
          hintText: AqarString.typeMessageHere,
        ),
      ),
    );
  }
}
