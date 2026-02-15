import 'package:flutter/material.dart';

/// チャットルームの状態を表すためのクラス
///
/// chatRoomIdはチャットルーム初期化時に生成されるランダムな値
///
/// isInitはチャットルームでチャットがスタートしているのかを表す値 true: 初期状態　false: スタートしている
@immutable
class ChatScreenState {
  final String chatRoomId;

  final bool isInit;

  const ChatScreenState._({required this.chatRoomId, required this.isInit});

  /// チャットルーム初期化のためのファクトリーコンストラクタ
  factory ChatScreenState.init({required String chatRoomId}) =>
      ChatScreenState._(chatRoomId: chatRoomId, isInit: true);

  /// チャットルーム初期化後，チャットが実際にスタートしたことを示すためのファクトリーコンストラクタ
  factory ChatScreenState.start({required String chatRoomId}) =>
      ChatScreenState._(chatRoomId: chatRoomId, isInit: false);
}
