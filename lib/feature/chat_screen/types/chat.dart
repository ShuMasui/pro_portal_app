import 'package:flutter/material.dart';

/// ChatDataを管理するためのもの
///
/// 入力中アニメーションの管理などもお行うため，immutableなオブジェクト
@immutable
class Chat {
  final String id;

  final String message;

  final bool isUser;

  final bool isLoading;

  final bool isDone;

  const Chat._({
    required this.id,
    required this.message,
    required this.isUser,
    required this.isLoading,
    required this.isDone,
  });

  /// ユーザーが送信したチャット履歴を示しているチャットデータの生成
  factory Chat.init({required String chatId, required String message}) =>
      Chat._(
        id: chatId,
        message: message,
        isUser: true,
        isLoading: false,
        isDone: false,
      );

  /// コピー
  Chat copyWith({
    String? message,
    bool? isUser,
    bool? isLoading,
    bool? isDone,
  }) {
    return Chat._(
      id: id,
      message: message ?? this.message,
      isUser: isUser ?? this.isUser,
      isLoading: isLoading ?? this.isLoading,
      isDone: isDone ?? this.isDone,
    );
  }

  /// チャットメッセージチェックのためのユーティリティ関数
  ///
  /// 現在はメッセージがからかどうかのみをチェック
  ///
  /// @return メッセージが有効かどうか 有効ならtrue 無効ならfalse
  static bool isMessageValid(String message) {
    // NOTE: 正規表現などによる形式チェックや禁止文字などのチェックも今後はここで行う
    return message.isNotEmpty;
  }
}
