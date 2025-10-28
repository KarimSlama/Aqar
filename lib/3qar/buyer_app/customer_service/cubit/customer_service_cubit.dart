import 'package:aqar/3qar/buyer_app/customer_service/cubit/customer_service_state.dart';
import 'package:aqar/3qar/buyer_app/customer_service/data/model/chat_message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/customer_service_repository.dart';

class CustomerServiceCubit extends Cubit<CustomerServiceState> {
  final CustomerServiceRepository _customerServiceRepository;
  final List<ChatMessage> _messages = [];

  CustomerServiceCubit(this._customerServiceRepository) : super(ChatInitial());

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      message: message,
      isUser: true,
      timestamp: DateTime.now(),
    );

    _messages.add(userMessage);
    emit(ChatLoaded(List.from(_messages)));

    emit(ChatLoading(List.from(_messages)));

    final response = await _customerServiceRepository.sendMessage(
      message: message,
    );

    response.when(
      success: (aiResponse) {
        final aiMessage = ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          message: aiResponse,
          isUser: false,
          timestamp: DateTime.now(),
        );

        _messages.add(aiMessage);
        emit(ChatLoaded(List.from(_messages)));
      },
      failure: (error) {
        emit(ChatError(error));

        Future.delayed(const Duration(seconds: 2), () {
          emit(ChatLoaded(List.from(_messages)));
        });
      },
    );

    //   // 💬 إضافة رد الـ AI
    //   final aiMessage = ChatMessage(
    //     id: DateTime.now().millisecondsSinceEpoch.toString(),
    //     message: response['response'] ?? response['output'] ?? 'No response',
    //     isUser: false,
    //     timestamp: DateTime.now(),
    //   );

    //   _messages.add(aiMessage);
    //   emit(ChatLoaded(List.from(_messages)));
    // } catch (e) {
    //   emit(ChatError(e.toString()));
    //   emit(ChatLoaded(List.from(_messages)));
    // }
  }

  void clearChat() {
    _messages.clear();
    emit(ChatInitial());
  }
}

// import 'package:aqar/3qar/buyer_app/customer_service/cubit/customer_service_state.dart';
// import 'package:aqar/3qar/buyer_app/customer_service/data/model/chat_message_model.dart'
//     show ChatMessage;
// import 'package:aqar/3qar/buyer_app/customer_service/data/network/customer_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomerServiceCubit extends Cubit<CustomerServiceState> {
//   final CustomerService _chatService;
//   final List<ChatMessage> _messages = [];
//   // final String userId;

//   CustomerServiceCubit(this._chatService) : super(ChatInitial());

//   Future<void> sendMessage(String message) async {
//     if (message.trim().isEmpty) return;

//     final userMessage = ChatMessage(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       message: message,
//       isUser: true,
//       timestamp: DateTime.now(),
//     );

//     _messages.add(userMessage);
//     emit(ChatLoaded(List.from(_messages)));

//     // عرض typing indicator
//     emit(ChatLoading());

//     try {
//       // إرسال الرسالة للـ n8n
//       final response = await _chatService.sendMessage(
//         message: message,
//         userId: '80061215-6deb-49d5-9f49-550464622c3e',
//       );

//       // إضافة رد الـ AI
//       final aiMessage = ChatMessage(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         message: response['response'] ?? response['output'] ?? 'No response',
//         isUser: false,
//         timestamp: DateTime.now(),
//       );

//       _messages.add(aiMessage);
//       emit(ChatLoaded(List.from(_messages)));
//     } catch (e) {
//       emit(ChatError(e.toString()));
//       emit(ChatLoaded(List.from(_messages)));
//     }
//   }

//   void clearChat() {
//     _messages.clear();
//     emit(ChatInitial());
//   }
// }
