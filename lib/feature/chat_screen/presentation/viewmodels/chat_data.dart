import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../types/chat.dart';

part 'chat_data.g.dart';

@riverpod
class ChatData extends _$ChatData {
  @override
  Chat build(String id) {
    return Chat.init(chatId: id, message: '');
  }

  void setUserMessage(String message) {
    state = state.copyWith(isUser: true, message: message);
  }

  void setAiMessage(String message) {
    state = state.copyWith(isUser: false, message: message, isLoading: true);
  }

  void toggleAiMessageLoading(bool isLoading) {
    if (state.isUser) {
      throw Exception("Cannot toggle loading status for user messages");
    }
    state = state.copyWith(isLoading: isLoading);
  }
}
