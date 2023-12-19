import 'package:flutter_test/flutter_test.dart';

import 'package:handler/handler.dart';

void main() {
  test('adds one to input values', () async {
    final handler = Handler();
    expect(await handler.execute(() => 10), 10);
    expect(await handler.execute(() => 30), 30);
    expect(await handler.execute(() => 50), 50);
  });
}
