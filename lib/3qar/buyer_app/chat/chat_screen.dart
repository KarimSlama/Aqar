import 'package:aqar/core/common/widgets/app_bar/normal_app_bar.dart';
import 'package:aqar/core/common/widgets/images/cached_images.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/routes.dart';
import '../../../core/routing/app_router.dart';
import 'cubit/chat_list_cubit.dart';
import 'cubit/chat_list_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChatListCubit>().fetchChatUsers();

    return Scaffold(
      appBar: NormalAqarAppBar(text: AqarString.chats),
      body: BlocBuilder<ChatListCubit, ChatListState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Loading chat users...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (users) {
              if (users.isEmpty) {
                return const Center(
                    child: Text('No users available for chat.'));
              }
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return InkWell(
                    onTap: () => context.pushNamed(
                      Routes.conversationScreen,
                      arguments: MessageScreenArgs(
                        userToId: user.id,
                        userToName: user.fullName,
                        userImage: user.image,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: AqarSizes.ms, vertical: AqarSizes.ms),
                      child: Row(
                        spacing: AqarSizes.md,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedImage(
                                width: 60, height: 60, image: user.image),
                          ),
                          SizedBox(width: AqarSizes.md),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.fullName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .apply(
                                            color: AqarHelperFunctions.isDark(
                                                    context)
                                                ? AqarColors.white
                                                : AqarColors.black)),
                                const Text('Tap to start chatting.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }
}
