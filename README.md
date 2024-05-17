![flutter_logcat_transparent](https://github.com/b3lon9/flutter_logcat/assets/119420119/0493edfd-c9e2-4bb3-b7fd-706d7ecd4977)


## 

[![Pub Version](https://img.shields.io/pub/v/flutter_logcat?color=blue)](https://pub.dev/packages/flutter_logcat)

<br/>



**when you click like💗 this, I will be very very happy:) <br/>

---

💘 <b>tool</b>🤍 <b>useful</b>💚 <b>simple</b>💙 <b>easy</b>💛 <b>like</b>💖

<br/>

<img src="https://github.com/b3lon9/flutter_logcat/assets/119420119/d5310fff-c4f2-4d9f-b37a-fcb283b814aa" alt="image" width="50%" height="50%">

## 🚀 struct
`flutter_logcat` need only three parameters there are `message`, `tag`, `path`  <br/><br/>
- `message` : if yon want input message to watch on console.  <br/>
- `tag`: this is when you define something tag name.  <br/>
- `path`: if you define true, you can watch file preference path. (default: false) <br/><br/>


## 💌 console print 

| message            | tag                | path               | output              |
| ------------------ | ------------------ | ------------------ | ------------------ |
| :heavy_check_mark: | :x:                | :x:                | `[className:lineNumber] message` |
| :heavy_check_mark: | :heavy_check_mark: | :x:                | `(tag) [className:lineNumber] message` |
| :heavy_check_mark: | :x:                | :heavy_check_mark: | `[className(packageName/className.dart):lineNumber] message` |
| :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | `(tag) [className(packageName/className.dart):lineNumber] message` |

<br/>

## 🌟 usage

- ### show only 'message' <br/>
**`Log.v([String]);`**
```dart
Log.v("message");
Log.i("message");
Log.d("message");
Log.w("message");
Log.e("message");
```
> [_ExampleScreenState:30] message <br/>
> ![image](https://github.com/b3lon9/flutter_logcat/assets/119420119/e2900c8a-c947-4d59-a575-631d5a387565)

<br/>

- ### show 'message' & 'path' <br/>
**`Log.v([String], path: [Boolean])`**
```dart
Log.v("message", path: true);
Log.i("message", path: true);
Log.d("message", path: true);
Log.w("message", path: true);
Log.e("message", path: true);
```
> [_ExampleScreenState(example/main.dart):35] message <br/>
> ![image](https://github.com/b3lon9/flutter_logcat/assets/119420119/a90df6ba-bb6a-45da-bc62-c351ea45f1e3)

<br/>

- ### show 'message' & 'tag' <br/>
**`Log.v([String], tag: [String])`**
```dart
Log.v("message", tag: "donguran");
Log.i("message", tag: "donguran");
Log.d("message", tag: "donguran");
Log.w("message", tag: "donguran");
Log.e("message", tag: "donguran");
```
> (donguran) [_ExampleScreenState(example/main.dart):48] message <br/>
> ![image](https://github.com/b3lon9/flutter_logcat/assets/119420119/691effe8-f208-4d49-a500-80e8e8d206b5)

<br/>


- ### setting Log's Configure
> - visible <br/>
> - tag <br/>
> - time 

- #### control visible👀 to Log. <br/>
**`Log.configure(visible: [Boolean])`**
```dart
import 'package:flutter/foundation.dart';

Log.configure(visible: kDebugMode);
```
- #### if you want setting default `tag` <br/>
**`Log.configure(visible: [Boolean], tag: [String])`**
```dart
Log.configure(visible: kDebugMode, tag: "donguran");

Log.v(...);
Log.i(...);
...
```
> ![image](https://github.com/b3lon9/flutter_logcat/assets/119420119/db63624a-1cb5-4fa7-b144-73d2fb888c94)

- #### if you want to see time this <br/>
**`Log.configure(visible: [Boolean], time: [Boolean])`**
```dart
Log.configure(visible: true, time: true);
```
> <img width="402" alt="image" src="https://github.com/b3lon9/flutter_logcat/assets/119420119/f4318b22-4d31-489d-908a-c669eb6d6374">


<br/>





<br/>

