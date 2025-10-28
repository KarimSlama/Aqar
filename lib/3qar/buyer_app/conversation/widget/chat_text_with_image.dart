import 'package:flutter/material.dart';

import '../../../../core/common/widgets/circulars/circular_container_with_shadow.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/helpers/helper_functions.dart';

class ChatTextWithImage extends StatelessWidget {
  final String message;
  final String time;
  final bool isMyMessage;

  const ChatTextWithImage({
    super.key,
    required this.message,
    required this.time,
    required this.isMyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment:
            isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: CircularContainerShadow(
                  isPaddingAll: false,
                  isCircularRadius: false,
                  containerColor: isMyMessage
                      ? (AqarHelperFunctions.isDark(context)
                          ? AqarColors.black
                          : AqarColors.white)
                      : AqarColors.green,
                  radius: isMyMessage ? 60 : 0,
                  topEnd: !isMyMessage ? 60 : 0,
                  horizontalPadding: 20,
                  verticalPadding: 10,
                  widget: Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(time),
          ),
        ],
      ),
    );
  }
}
