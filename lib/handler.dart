library handler;

import 'dart:async';

class Handler<T> {
  bool _isCallInProgress = false;
  Completer<T>? _callCompleter;

  Handler();

  Future<T?> _waitForPreviousCall() async {
    if (_isCallInProgress) {
      _callCompleter ??= Completer<T>();
      return await _callCompleter?.future;
    }
    return null;
  }

  Future<T?> execute(FutureOr<T?> Function() function) async {
    final previousCallResult = await _waitForPreviousCall();

    if (previousCallResult != null) {
      return previousCallResult;
    }

    try {
      _isCallInProgress = true;
      final result = await function();
      _callCompleter?.complete(result);
      return result;
    } finally {
      _isCallInProgress = false;
      _callCompleter?.complete();
      _callCompleter = null;
    }
  }
}
