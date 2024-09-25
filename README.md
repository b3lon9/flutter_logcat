![flutter_logcat_transparent](https://github.com/b3lon9/flutter_logcat/assets/119420119/0493edfd-c9e2-4bb3-b7fd-706d7ecd4977)

<hr/>

[![Pub Version](https://img.shields.io/pub/v/flutter_logcat?color=blue)](https://pub.dev/packages/flutter_logcat)

<h3>In Flutter, logs are displayed in the console without any distinguishing colors. <br/>
However, by using this package, you can view messages in the console with colors that you define. <br/>
Additionally, you can configure it so that logs are hidden in debug mode, and you can also set it to display tags, file paths, and timestamps.</h3>


<br/>

## 📸 Demo

In Console

<img src="https://github.com/b3lon9/flutter_logcat/assets/119420119/d5310fff-c4f2-4d9f-b37a-fcb283b814aa" alt="image" width="50%" height="50%">

<br/>

## 🌱 Getting Started

[Install Package](https://pub.dev/packages/flutter_logcat/install/)

`flutter_logcat` need only three parameters there are `message`, `tag`, `path`, `time`  <br/>
- `message` : If yon want input message to watch on console.  <br/>
- `tag`: Custom own your's tag name.  <br/>
- `path`: You can watch file preference path. (default: false) <br/>
- `time`: You can watch current time. (default: false) <br/>

<br/>

## 💌 Console Print 
<h3>Parameters</h3>

| parameter            | required                | type               |  default    | output                                                        |
| ---------------------| ------------------------|--------------------|-------------|---------------------------------------------------------------|
| message              | :heavy_check_mark:      | String             |             |  `[className:lineNumber] message`                             |
| tag                  | :x:                     | String             |             |  `(tag) [className:lineNumber] message`                       |
| path                 | :x:                     | bool               |  false      |  `[className(packageName/className.dart):lineNumber] message` |
| time                 | :x:                     | bool               |  false      |  `2024-09-25T00:00:000.000000:[className:linenumber] message` |

<br/>

## 🚀 Usage

- ### Show only 'message' <br/>
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

- ### Show 'message' & 'path'
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

- ### Show 'message' & 'tag'
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


- ### Show 'message' & 'tag'
**`Log.v([String], tag: [String])`**
```dart
Log.v("message", time: true);
Log.i("message", time: true);
Log.d("message", time: true);
Log.w("message", time: true);
Log.e("message", time: true);
```
> 2024-09-25T00:00:000.000000:[className:linenumber] message <br/>
> ![image](https://github.com/user-attachments/assets/03a06561-3c20-467d-98fc-139f2b850e5f)



<br/>

## 🧭 Set Log Configure

<h4>It's okay if you don't declare this function. <br/>
You only need to use it when an overall setup is required.</h4>

> - visible <br/>
> - tag <br/>
> - time 

- #### Control Visible👀 to Log.
**`Log.configure(visible: [Boolean])`**
```dart
import 'package:flutter/foundation.dart';

Log.configure(visible: kDebugMode);
```
- #### If you want setting default `tag` 
**`Log.configure(visible: [Boolean], tag: [String])`**
```dart
Log.configure(visible: kDebugMode, tag: "donguran");

Log.v(...);
Log.i(...);
...
```
> ![image](https://github.com/b3lon9/flutter_logcat/assets/119420119/db63624a-1cb5-4fa7-b144-73d2fb888c94)

- #### If you want to see time this
**`Log.configure(visible: [Boolean], time: [Boolean])`**
```dart
Log.configure(visible: true, time: true);
```
> <img width="402" alt="image" src="https://github.com/b3lon9/flutter_logcat/assets/119420119/f4318b22-4d31-489d-908a-c669eb6d6374">


<br/>
