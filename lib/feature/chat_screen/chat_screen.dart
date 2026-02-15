/// チャット画面を構成するライブラリ
///
/// QuoteRepositoryMeigenは、名言APIから名言を取得するためのリポジトリ
/// ChatRepositoryFirebaseは、Firebaseを使用してチャットのデータを管理するためのリポジトリ
/// ChatScreenは、チャット画面のUIを構築するためのウィジェット（単体で動作します）
library;

export 'presentation/chat_screen.dart';
export 'domain/chat_repository.dart';
export 'domain/quote_repository.dart';
export 'data/quote_repository_meigen.dart';
export 'data/chat_repository_firebase.dart';
