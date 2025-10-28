import 'package:aqar/3qar/buyer_app/customer_service/data/model/chat_message_model.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: message.isUser ? theme.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6.h,
          children: [
            Text(
              message.message,
              style: theme.textTheme.bodyMedium?.apply(
                color: message.isUser ? AqarColors.white : AqarColors.black,
              ),
            ),
            Text(
              AqarHelperFunctions.formatTime(message.timestamp),
              style: theme.textTheme.bodyMedium?.apply(
                color: message.isUser
                    ? AqarColors.white.withValues(alpha: .7)
                    : AqarColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
