import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Toast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;
  static bool _isVisible = false;

  static void show(
    String msg,
    BuildContext context, {
    int duration = 1,
    int gravity = 0,
  }) async {
    if (_isVisible) {
      return;
    }
    final ThemeData theme = Theme.of(context);
    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: theme.brightness == Brightness.dark ? theme.textTheme : theme.primaryTextTheme,
      platform: theme.platform,
    );
    _isVisible = true;
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => BlinkingToastWidget(
          widget: Container(
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.none,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XCC000000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: new Text(msg, softWrap: true, style: darkTheme.textTheme.body1),
                    ),
                  ),
                )),
          ),
          gravity: gravity == null ? BOTTOM : gravity),
    );
    overlayState.insert(overlayEntry);
    await new Future.delayed(Duration(seconds: duration == null ? LENGTH_SHORT : duration));
    overlayEntry.remove();
    _isVisible = false;
  }
}

class BlinkingToastWidget extends StatefulWidget {
  BlinkingToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  _BlinkingToastWidgetState createState() => new _BlinkingToastWidgetState();
}

class _BlinkingToastWidgetState extends State<BlinkingToastWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: widget.gravity == 2 ? 50 : null,
        bottom: widget.gravity == 0 ? 50 : null,
        child: new Container(
          color: Colors.transparent,
          child: widget.widget,
        ));
  }
}
