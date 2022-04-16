import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class ToastWebPlugin {
  ToastWebPlugin() {
    injectCssAndJS();
  }

  static void registerWith(Registrar registrar) {
    final MethodChannel channel =
        MethodChannel('appdev/FlutterToast', const StandardMethodCodec(), registrar);
    final ToastWebPlugin instance = ToastWebPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  /// Handle Method Callbacks from [MethodChannel].
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'showToast':
        showToast(call.arguments);
        return true;
      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The toast plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }

  /// it to [showWebToast]
  showToast(args) {
    String bgColor = args['webBgColor'] ?? "linear-gradient(to right, #00b09b, #96c93d)";

    String textColor = args['textcolor'];

    int duration = args['duration'] == null ? 1000 : (int.parse(args['duration'].toString()));

    bool showClose = args['webShowClose'] ?? false;
    showWebToast(args['msg'], args['gravity'],
        bgcolor: bgColor, textColor: textColor, duration: duration, showClose: showClose);
  }

  showWebToast(String msg, String gravity,
      {int duration = 1000,
      String bgcolor = "linear-gradient(to right, #00b09b, #96c93d)",
      bool showClose = false,
      String? textColor}) {
    String message = msg.replaceAll("'", "\\'").replaceAll("\n", "<br />");
    html.Element? ele = html.querySelector("#toast-content");
    String content = """
          var toastElement = Toastify({
            text: '$message',
            gravity: '$gravity',
            position: 'center',
            duration: $duration,
            close: $showClose,
            backgroundColor: "$bgcolor",
          });
          toastElement.showToast();
        """;
    if (html.querySelector("#toast-content") != null) {
      ele!.remove();
    }
    final html.ScriptElement scriptText = html.ScriptElement()
      ..id = "toast-content"
      ..innerHtml = content;
    html.querySelector('head')!.children.add(scriptText);
    if (textColor != null) {
      html.Element toast = html.querySelector('.toastify')!;
      String tcRadix = textColor;
      final String tC = "${tcRadix.substring(2)}${tcRadix.substring(0, 2)}";
      toast.style.setProperty('color', "#$tC");
    }
  }

  Future<void> injectCssAndJS() async {
    final List<Future<void>> loading = <Future<void>>[];
    final List<html.HtmlElement> tags = <html.HtmlElement>[];

    final html.LinkElement css = html.LinkElement()
      ..id = 'toast-css'
      ..attributes = {"rel": "stylesheet"}
      ..href = 'assets/packages/toast/assets/toastify.css';
    tags.add(css);

    final html.ScriptElement script = html.ScriptElement()
      ..async = true
      // ..defer = true
      ..src = "assets/packages/toast/assets/toastify.js";
    loading.add(script.onLoad.first);
    tags.add(script);
    html.querySelector('head')!.children.addAll(tags);

    await Future.wait(loading);
  }
}
