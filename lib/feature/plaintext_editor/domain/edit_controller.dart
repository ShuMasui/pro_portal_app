import 'package:flutter/foundation.dart';

/// このコントローラーは、テキストの状態をこの内部のみで管理し、その情報を外部へNotifyするためのコントローラーです
/// 外部からのテキスト取得は [getText] メソッドを使用してください
/// クリアする場合は[clearText]メソッドを使用してください
///
class EditController extends ChangeNotifier {
  /// テキストを取得するためのコールバック
  /// 登録している場は、これを実装しないとgetTextなどが使えません
  String Function()? _getText;
  set getTextCallback(String Function() callback) => _getText = callback;

  /// テキストフィールドをクリアにするためのコールバック
  /// /// 登録している場は、これを実装しないとclearTextなどが使えません
  VoidCallback? _clearText;
  set clearTextCallback(VoidCallback? callback) => _clearText = callback;

  String getText() {
    if (_getText != null) {
      return _getText!();
    }
    return '';
  }

  void clearText() {
    if (_clearText != null) {
      _clearText!();
    }
  }

  /// 登録されたコールバック関数を削除し、参照を解放します
  @override
  void dispose() {
    _getText = null;
    _clearText = null;
    super.dispose();
  }
}
