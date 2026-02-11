import 'dart:ui_web' as ui_web; // グローバルにui_webを流したくないので別名でインポート
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web; // グローバルにwebを流したくないので別名でインポート
import 'dart:js_interop';

import '../domain/edit_controller.dart';

/// This is the PlainTextEditor for Flutter Web Platforms
///
/// Ex.
/// - Web
class PlaintextEditor extends StatefulWidget {
  final EditController controller;
  final ValueChanged<int> onChangedLetterCount;
  final double? height, width;

  const PlaintextEditor({
    super.key,
    required this.controller,
    required this.onChangedLetterCount,
    this.height = double.infinity,
    this.width = double.infinity,
  });

  @override
  State<PlaintextEditor> createState() => _PlaintextEditorState();
}

class _PlaintextEditorState extends State<PlaintextEditor> {
  late final web.HTMLTextAreaElement _textAreaElement;
  final String _viewType =
      'flutter_plaintext_editor-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();

    _textAreaElement = web.HTMLTextAreaElement()
      ..placeholder = '日記を書いてください...'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.border = 'none'
      ..style.outline = 'none'
      ..style.resize = 'none'
      ..style.fontFamily = 'monospace'
      ..style.fontSize = '20px'
      ..style.lineHeight = '2.5'
      ..style.padding = '16px'
      ..style.boxSizing = 'border-box'
      ..style.backgroundColor = '#f5f5f5';

    // 2. イベントリスナーの登録 (JS Interop)
    // 'input' イベントを監視。Dartの関数をJSで実行可能な形式(.toJS)に変換して渡す
    // 型安全にaddEventListenerを使える
    _textAreaElement.addEventListener(
      'input',
      (web.Event event) {
        final text = _textAreaElement.value;
        widget.onChangedLetterCount(text.length);
      }.toJS,
    );

    // 3. コントローラーへの登録
    widget.controller.getTextCallback = () {
      return _textAreaElement.value;
    };

    widget.controller.clearTextCallback = () {
      _textAreaElement.value = '';
    };

    // dart:ui_webはブラウザーの定レイヤーAPIとやり取りするために、Dart内で用いられるHTML要素をまとめて管理するためのやつ
    // 要は、FlutterアプリでHTML要素をWidgetとして表示したかったらこれを使ってねって感じ
    // でui_webで登録されてるidを使ってhtmlelementviewはhtml要素をFlutterのWidgetとして呼び出すことができるようになる！
    // ignore: undefined_prefixed_name
    ui_web.platformViewRegistry.registerViewFactory(
      _viewType,
      (int viewId) => _textAreaElement,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // HTML要素のクリーンアップはDartがDOMに対して自動的にやってくれる
    // ここでは、Dartに対する参照を明示的に削除するようにする（念のため）
    _textAreaElement.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: HtmlElementView(
        viewType: _viewType,
        onPlatformViewCreated: (_) {
          _textAreaElement.focus();
        },
      ),
    );
  }
}
