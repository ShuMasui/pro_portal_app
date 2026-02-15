import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ChatRepository {
  /// 対象のリポジトリに対してメッセージを送信し，結果を受信します
  Future<String> sendMessage(String message);
}

final chatProvider = Provider<ChatRepository>(
  (ref) => throw UnimplementedError(),
);
