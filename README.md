# Toast

A Flutter Toast plugin.

> Supported  Platforms
> * Android 
> fix BadTokenException and no notification permission required
> * IOS
> use https://github.com/scalessec/Toast-Swift


## How to Use

```yaml
# add this line to your dependencies
toast: ^0.0.1
```

```dart
import 'package:toast/toast.dart';
```

```dart
Toast.show("Toast plugin app", duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
```

property | description
--------|------------
msg | String (Not Null)(required)
duration| Toast.LENGTH_SHORT or Toast.LENGTH_LONG (optional)
gravity | Toast.TOP (or) Toast.CENTER (or) Toast.BOTTOM
timeInSecForIos | int (only for ios)


<img src="screenshot/141107.png" width="320px" /> <img src="screenshot/141134.png" width="320px" />
