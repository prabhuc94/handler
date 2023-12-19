<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Handler: Can able to handle multiple async calls once at a time

## Features

Reduce memory while multiple api calls

## Getting started

```dart
import 'package:handler/handler.dart';
```

## Usage

```dart
import 'dart:math';
import 'package:handler/handler.dart';
void main() async {
  final handler = Handler();

  // Use the rate limiter with any function
  for (var i = 0; i < 5; i++) {
    final result = await handler.execute((() async {
      // Simulate a time-consuming operation
      await Future.delayed(Duration(seconds: 2));
      return Random().nextInt(9999);
    }));
    print(result);
  }
}
```
