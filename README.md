# Proportal
```
lib/
├── main.dart
├── app.dart           # アプリ全体のテーマやRouter設定
├── core/              # 全機能で共通の基盤
│   ├── common_widgets/
│   ├── constants/
│   ├── exceptions/
│   ├── theme/
│   └── utils/
├── features/          # ★画面・機能ごとに分割
│   ├── auth/          # 認証機能例
│   │   ├── domain/    # Entity, Repositoryの抽象クラス
│   │   ├── data/      # Repository実装, Data Source (API等)
│   │   ├── presentation/ # UI層
│   │   │   ├── views/ # 画面
│   │   │   ├── widgets/ # その機能専用の部品
│   │   │   └── view_models/ # (RiverpodのNotifierなど)
│   │   └── application/ # ユースケース（必要に応じて）
│   └── chat/          # チャット機能例
└── shared/            # プロジェクト固有だが共通で使うEntityなど
```
∫
