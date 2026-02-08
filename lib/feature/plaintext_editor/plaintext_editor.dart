/// Plaintext Editor Web Implementation and Native Implementation
///
/// Avalable Platforms:
/// - Web
///
/// Note: Not untile Native Platforms are supported.
library;

export 'presentation/plaintext_editor_stub.dart'
    if (dart.library.html) 'presentation/plaintext_editor_web.dart'
    if (dart.library.io) 'presentation/plaintext_editor_web.dart';

export 'domain/edit_controller.dart';
