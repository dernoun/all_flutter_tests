import 'package:flutter_test/flutter_test.dart';
import 'package:startup_namer/examples/counter.dart';

void main() {
  group('counter', () {
    test('Counter value should start at 0', () {
      final counter = Counter();

      expect(counter.value, 0);
    });
    test('Counter value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });
    test('Counter should be decremented', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
