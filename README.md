![flutter_logcat_transparent](https://github.com/b3lon9/flutter_logcat/assets/119420119/0493edfd-c9e2-4bb3-b7fd-706d7ecd4977)

<hr/>

[![Pub Version](https://img.shields.io/pub/v/flutter_logcat?color=blue)](https://pub.dev/packages/flutter_logcat)

<h3>In Flutter, logs are displayed in the console without any distinguishing colors. <br/>
However, by using this package, you can view messages in the console with colors that you define. <br/>
Additionally, you can configure it so that logs are hidden in debug mode, and you can also set it to display tags, file paths, and timestamps.</h3>


<br/>

## 📸 Demo

In Console

### iOS & Others
> <img src="https://github.com/user-attachments/assets/cd07c6ff-5220-4d1b-81bc-2b33dddb6637" alt="image" width="500">

### Android
> <img src="https://github.com/b3lon9/flutter_logcat/assets/119420119/d5310fff-c4f2-4d9f-b37a-fcb283b814aa" alt="image" width="500">

<br/>
<br/>

## 📌 Features
- [Usage](#-Usage)
- [Configure](#-Set-Log-Configure)
- [Stream](#-Stream-Logcat-messages)
- [History](#-History-logcat-prints)

<br/>

## 🌱 Getting Started

[Install Package](https://pub.dev/packages/flutter_logcat/install/)

`flutter_logcat` need only three parameters there are `message`, `tag`, `path`, `time`, `history`.  <br/>
- `message` : If yon want input message to watch on console.  <br/>
- `tag`: Custom own your's tag name.  <br/>
- `path`: You can watch file preference path. (default: false) <br/>
- `time`: You can watch current time. (default: false) <br/>
- `history`: You can call log history all prints. <br/>

<br/>

## 💌 Console Print 
<h3>Parameters</h3>

| parameter            | required                | type               |  default    | output                                                        |
| ---------------------| ------------------------|--------------------|-------------|---------------------------------------------------------------|
| message              | :heavy_check_mark:      | String             |             |  `[className:lineNumber] message`                             |
| tag                  | :x:                     | String             |             |  `(tag) [className:lineNumber] message`                       |
| path                 | :x:                     | bool               |  false      |  `[className(packageName/className.dart):lineNumber] message` |
| time                 | :x:                     | bool               |  false      |  `2024-09-25T00:00:000.000000:[className:linenumber] message` |
| history              | :x:                     | bool               |  false      |  :x:                                                          |

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
#### iOS & Others
> <img src="https://github.com/user-attachments/assets/89d2b215-30d3-4c98-86f3-ddd5fc0cf103" alt="image" width="300">

#### Android
> <img src="https://github.com/b3lon9/flutter_logcat/assets/119420119/e2900c8a-c947-4d59-a575-631d5a387565" alt="image" width="300">

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

#### iOS & Others
> <img src="https://github.com/user-attachments/assets/9a464118-e80d-4f6f-b6eb-d9e4ec2975bb" alt="image" width="420">

#### Android
> <img src="https://github.com/b3lon9/flutter_logcat/assets/119420119/a90df6ba-bb6a-45da-bc62-c351ea45f1e3" alt="image" width="420">


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

#### iOS & Others
> <img src="https://github.com/user-attachments/assets/a93bf3d4-6faf-41d8-ba6b-d7c8c40f1615" alt="image" width="420">

#### Android
> <img src="https://github.com/b3lon9/flutter_logcat/assets/119420119/691effe8-f208-4d49-a500-80e8e8d206b5" alt="image" width="420">


<br/>


- ### Show 'message' & 'time'
**`Log.v([String], time: [String])`**
```dart
Log.v("message", time: true);
Log.i("message", time: true);
Log.d("message", time: true);
Log.w("message", time: true);
Log.e("message", time: true);
```
#### iOS & Others
> <img src="https://github.com/user-attachments/assets/8e4c1c09-ced3-4bae-9d05-d76098932584" alt="image" width="460">

#### Android
> <img src="https://github.com/user-attachments/assets/03a06561-3c20-467d-98fc-139f2b850e5f" alt="image" width="460">

<br/>

## 🧭 Set Log Configure

<h4>It's okay if you don't declare this function. <br/>
You only need to use it when an overall setup is required.</h4>

> - visible <br/>
> - tag <br/>
> - time <br/>
> - history

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


## 📎 Service, Background Functions
```dart
Log.s("message from service");
Log.x("message from background");
```
#### iOS & Others
> <img src="https://github.com/user-attachments/assets/db7cbbb5-bfbe-4886-8ebb-c3f9dc0cf363" alt="image" width="400">

#### Android
> <img src="https://github.com/user-attachments/assets/c9217399-af5e-42a4-bda1-1e7047df5690" alt="image" width="400">

<br/>

## 🌀 Stream Logcat messages
```dart
Log.stream(
  listen: (message) {
    print(message);
  },
);
```

#### remove Stream
```dart
Log.removeStream();
```

<br/>

## 📑 History logcat prints
If you want see again Log function datas that called `history` getter function. <br/>
At first, You should define `history` parameter in `configure`function.
```dart
Log.configure(visible: .. , history: true);

final String history = Log.history;
```

#### Clear History datas
```dart
Log.clearHistory();
```
<br/>
