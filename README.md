# Toast

A Flutter Toast plugin.


[![pub package](https://img.shields.io/pub/v/toast.svg)](https://pub.dev/packages/toast)



## How to Use

```yaml
# add this line to your dependencies
toast: ^0.3.0
```

```dart
import 'package:toast/toast.dart';
```

```dart
ToastContext.init(context);
```

```dart
Toast.show("Toast plugin app", duration: Toast.lengthShort, gravity:  Toast.bottom);
```

property | description
--------|------------
msg | String (Not Null)(required)
duration| Toast.lengthShort or Toast.lengthLong (optional)
gravity | Toast.top (or) Toast.center[not supported on web] (or) Toast.bottom
textStyle | TextStyle (default fontSize:15, color: Colors.white)
backgroundColor | Color (default Color(0xAA000000))
backgroundRadius | double （default 16)
border| Border (optional)


![toast](https://github.com/huclengyue/FlutterToast/blob/master/screenshot/141107.png)
![toast](https://github.com/huclengyue/FlutterToast/blob/master/screenshot/141134.png)


## License

    MIT License

