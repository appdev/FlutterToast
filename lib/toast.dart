import 'dart:async';

import 'package:flutter/services.dart';

enum Gravity { TOP, BOTTOM, CENTER }

class Toast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static const String CHANNEL = "UtilGroup/Toast";
  static const ShowToast = "showToast";
  static const MethodChannel _channel = const MethodChannel(CHANNEL);

  static Future<String> show(
    String msg, {
    int duration = 1,
    int gravity = 0,
  }) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'msg': msg,
      'duration': duration == null ? 1 : duration,
      'gravity': gravity == null ? 0 : gravity,
    };
    String res = await _channel.invokeMethod(ShowToast, params);
    return res;
  }
}
