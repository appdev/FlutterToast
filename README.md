# Toast

A Flutter Toast plugin.

## How to Use

```yaml
# add this line to your dependencies
toast: ^0.1.4
```

```dart
import 'package:toast/toast.dart';
```

```dart
Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
```

property | description
--------|------------
msg | String (Not Null)(required)
context | BuildContext (Not Null)(required)
duration| Toast.LENGTH_SHORT or Toast.LENGTH_LONG (optional)
gravity | Toast.TOP (or) Toast.CENTER (or) Toast.BOTTOM
textColor | Color (default white)
backgroundColor | Color (default Color(0xAA000000))
backgroundRadius | double （default 16)


![toast](https://github.com/huclengyue/FlutterToast/blob/master/screenshot/141107.png)
![toast](https://github.com/huclengyue/FlutterToast/blob/master/screenshot/141134.png)


## License

    MIT License

