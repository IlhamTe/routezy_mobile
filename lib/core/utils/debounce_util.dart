import 'dart:async';

import 'package:flutter/services.dart';

class DebounceUtil {
  final int milliseconds;
  Timer? _timer;

  DebounceUtil({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancel() => _timer?.cancel();
}
