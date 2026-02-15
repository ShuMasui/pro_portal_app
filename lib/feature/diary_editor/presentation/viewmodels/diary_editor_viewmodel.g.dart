// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DiaryEditorViewmodel)
final diaryEditorViewmodelProvider = DiaryEditorViewmodelProvider._();

final class DiaryEditorViewmodelProvider
    extends $AsyncNotifierProvider<DiaryEditorViewmodel, DiaryEditorState> {
  DiaryEditorViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'diaryEditorViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$diaryEditorViewmodelHash();

  @$internal
  @override
  DiaryEditorViewmodel create() => DiaryEditorViewmodel();
}

String _$diaryEditorViewmodelHash() =>
    r'1a3612816634f7fee042271c270c4fad96d8a2b7';

abstract class _$DiaryEditorViewmodel extends $AsyncNotifier<DiaryEditorState> {
  FutureOr<DiaryEditorState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DiaryEditorState>, DiaryEditorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DiaryEditorState>, DiaryEditorState>,
              AsyncValue<DiaryEditorState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
