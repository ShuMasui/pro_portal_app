// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatData)
final chatDataProvider = ChatDataFamily._();

final class ChatDataProvider extends $NotifierProvider<ChatData, Chat> {
  ChatDataProvider._({
    required ChatDataFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chatDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatDataHash();

  @override
  String toString() {
    return r'chatDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatData create() => ChatData();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Chat value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Chat>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatDataHash() => r'fba8a25f715e63ac6d69db63827ce29041a9c3d4';

final class ChatDataFamily extends $Family
    with $ClassFamilyOverride<ChatData, Chat, Chat, Chat, String> {
  ChatDataFamily._()
    : super(
        retry: null,
        name: r'chatDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChatDataProvider call(String id) =>
      ChatDataProvider._(argument: id, from: this);

  @override
  String toString() => r'chatDataProvider';
}

abstract class _$ChatData extends $Notifier<Chat> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  Chat build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Chat, Chat>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Chat, Chat>,
              Chat,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
