![image](https://github.com/b3lon9/flutter_logcat/assets/119420119/bd08bd47-96f2-4805-a5aa-0fd4451095b5)

# Flutter (console)Logcat Filter

[![Pub Version](https://img.shields.io/pub/v/flutter_logcat?color=blue)](https://pub.dev/packages/flutter_logcat)

<br/>

<b>tool</b>🤍 <b>useful</b>💚 <b>simple</b>💙 <b>easy</b>💛 <b>like</b>❤

<br/>

<img src="https://github.com/b3lon9/flutter_logcat/assets/119420119/d5310fff-c4f2-4d9f-b37a-fcb283b814aa" alt="image" width="50%" height="50%">

## add
```shell
flutter pub add flutter_logcat
```
<br/>

## import
```dart
import 'package:flutter_logcat/flutter_logcat.dart'
```
<br/>

## usage

- normal <br/>
result > `[_ExampleScreenState:30] message`
```dart
Log.v("message");
Log.i("message");
Log.d("message");
Log.w("message");
Log.e("message");
```

- add 'path' (default: false, type - bool) <br/>
result > `[_ExampleScreenState(example/main.dart):35] message`
```dart
Log.v("message", path: true);
Log.i("message", path: true);
Log.d("message", path: true);
Log.w("message", path: true);
Log.e("message", path: true);
```

- add 'tag' (type - String) <br/>
result > `(donguran) [_ExampleScreenState(example/main.dart):48] message`
```dart
Log.v("message", tag: "donguran");
Log.i("message", tag: "donguran");
Log.d("message", tag: "donguran");
Log.w("message", tag: "donguran");
Log.e("message", tag: "donguran");
```


<br/>
<br/>

## LICENSE
```text
MIT License

Copyright (c) 2024 neander of donguran

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
