import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_list.g.dart';

@riverpod
class ChatList extends _$ChatList {
  @override
  List<String> build() {
    return <String>[];
  }

  // 生成されたIDをチャットリストに追加する
  void addChatId({required String id}) {
    state = [id, ...state];
  }

  // チャットIDを一定のルールに従って生成するためのユーティリティ関数
  static String createChatId({required String baseId}) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return '$baseId-$timestamp';
  }
}
