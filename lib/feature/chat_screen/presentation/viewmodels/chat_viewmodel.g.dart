// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// チャット画面のコントローラー
///
/// チャット開始前なのかどうかの状態を持つ
///
/// チャット開始後であればAsyncDataとしてchatRoomIdを持つ
///
/// チャット開始前は，chatRoomIdがempty

@ProviderFor(ChatViewmodel)
final chatViewmodelProvider = ChatViewmodelProvider._();

/// チャット画面のコントローラー
///
/// チャット開始前なのかどうかの状態を持つ
///
/// チャット開始後であればAsyncDataとしてchatRoomIdを持つ
///
/// チャット開始前は，chatRoomIdがempty
final class ChatViewmodelProvider
    extends $AsyncNotifierProvider<ChatViewmodel, ChatScreenState> {
  /// チャット画面のコントローラー
  ///
  /// チャット開始前なのかどうかの状態を持つ
  ///
  /// チャット開始後であればAsyncDataとしてchatRoomIdを持つ
  ///
  /// チャット開始前は，chatRoomIdがempty
  ChatViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatViewmodelHash();

  @$internal
  @override
  ChatViewmodel create() => ChatViewmodel();
}

String _$chatViewmodelHash() => r'010c85329f77e6340a03f5a1494b77d89052b99b';

/// チャット画面のコントローラー
///
/// チャット開始前なのかどうかの状態を持つ
///
/// チャット開始後であればAsyncDataとしてchatRoomIdを持つ
///
/// チャット開始前は，chatRoomIdがempty

abstract class _$ChatViewmodel extends $AsyncNotifier<ChatScreenState> {
  FutureOr<ChatScreenState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ChatScreenState>, ChatScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatScreenState>, ChatScreenState>,
              AsyncValue<ChatScreenState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
