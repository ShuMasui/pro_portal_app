import 'package:flutter/rendering.dart';
import 'package:proportal_app/feature/chat_screen/domain/quote_repository.dart';
import 'package:proportal_app/feature/chat_screen/presentation/viewmodels/chat_data.dart';
import 'package:proportal_app/feature/chat_screen/presentation/viewmodels/chat_list.dart';

import '../../types/chat_screen_state.dart';
import '../../types/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'chat_viewmodel.g.dart';

/// チャット画面のコントローラー
///
/// チャット開始前なのかどうかの状態を持つ
///
/// チャット開始後であればAsyncDataとしてchatRoomIdを持つ
///
/// チャット開始前は，chatRoomIdがempty
@riverpod
class ChatViewmodel extends _$ChatViewmodel {
  @override
  FutureOr<ChatScreenState> build() {
    final uuid = Uuid();
    return ChatScreenState.init(chatRoomId: uuid.v4());
  }

  Future<void> sendMessage(String message) async {
    // NOTE: stateは必ずtrueにする（処理が正常に完了した場合））
    state = AsyncData(
      ChatScreenState.start(chatRoomId: state.value!.chatRoomId),
    );

    try {
      // メッセージが異常ならエラーを吐いて終了
      Chat.isMessageValid(message) ? null : throw Exception('Invalid message');

      // 一意なチャットIDの生成
      final messageId = ChatList.createChatId(baseId: state.value!.chatRoomId);

      // IDの登録
      ref.watch(chatListProvider.notifier).addChatId(id: messageId);
      // メッセージの中身の登録
      ref.watch(chatDataProvider(messageId).notifier).setUserMessage(message);

      final response = await Future(
        () => '現在，AIチャット機能はご利用いただけません',
      ); //await ref.watch(chatProvider).sendMessage(message);

      final responseMessageId = ChatList.createChatId(
        baseId: state.value!.chatRoomId,
      );
      ref.watch(chatListProvider.notifier).addChatId(id: responseMessageId);

      ref
          .watch(chatDataProvider(responseMessageId).notifier)
          .setAiMessage(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// 名言を取得し，チャット画面に挿入します
  ///
  /// ボタンから呼び出されることを前提としているため，ダミーメッセージの登録も行います
  Future<void> fetchQuote() async {
    /// NOTE: チャットが始まった場合は必ず，状態を更新する
    state = AsyncData(
      ChatScreenState.start(chatRoomId: state.value!.chatRoomId),
    );

    try {
      // 一意なメッセージIDを生成
      final messageId = ChatList.createChatId(baseId: state.value!.chatRoomId);
      ref.watch(chatListProvider.notifier).addChatId(id: messageId);

      // ダミーメッセージを登録
      final message = '日記の話題にするために，名言を教えてください';
      ref.watch(chatDataProvider(messageId).notifier).setUserMessage(message);

      // 名言を取得
      final quote = await ref.watch(quoteProvider).fetchQuote();

      // 返却されたメッセージをAIの屁の塔として登録
      final responseMessageId = ChatList.createChatId(
        baseId: state.value!.chatRoomId,
      );
      ref.watch(chatListProvider.notifier).addChatId(id: responseMessageId);
      ref
          .watch(chatDataProvider(responseMessageId).notifier)
          .setAiMessage(
            '${quote.quote}\n- ${quote.author}\nを教えます！\nいい日記が書けるようにお祈りしています！',
          );
      // debugPrint('fetchQuote succeeded: ${quote.quote} - ${quote.author}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
