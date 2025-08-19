import 'package:aqar/3qar/buyer_app/conversation/cubit/message_cubit.dart';
import 'package:aqar/3qar/buyer_app/conversation/cubit/message_state.dart';
import 'package:aqar/3qar/buyer_app/conversation/widget/message_input_text_field.dart';
import 'package:aqar/core/common/widgets/app_bar/normal_app_bar.dart';

import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/chat_text_with_image.dart';

class ConversationScreen extends StatefulWidget {
  final String userToId;
  final String userToName;
  final String userImage;

  const ConversationScreen({
    super.key,
    required this.userToId,
    required this.userToName,
    required this.userImage,
  });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAqarAppBar(
        text: widget.userToName,
        hasLeading: true,
        isConversation: true,
        image: widget.userImage,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.video_copy)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocListener<MessageCubit, MessageState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (messages, currentUserId) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });
                  },
                  error: (errorMessage) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $errorMessage')),
                    );
                  },
                );
              },
              child: BlocBuilder<MessageCubit, MessageState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () =>
                        const Center(child: Text('Say something...')),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (messages, currentUserId) {
                      return ScrollConfiguration(
                        behavior: ScrollBehavior().copyWith(overscroll: true),
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: messages.length,
                          itemBuilder: (_, index) {
                            final message = messages[index];
                            return ChatTextWithImage(
                              key: ValueKey(message.id),
                              message: message.message,
                              time: AqarHelperFunctions.formatDateTime(
                                  message.createdAt.toIso8601String()),
                              isMyMessage: message.isMyMessage(currentUserId),
                            );
                          },
                        ),
                      );
                    },
                    error: (errorMessage) =>
                        Center(child: Text('Error: $errorMessage')),
                    orElse: () => SizedBox.shrink(),
                  );
                },
              ),
            ),
          ),
          MessageInputField(
            messageController: _messageController,
            onSendPressed: () {
              if (_messageController.text.isNotEmpty) {
                context
                    .read<MessageCubit>()
                    .sendMessage(_messageController.text, widget.userToId);
                _messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
