import 'package:dart_data_structures/queues/queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DoubleStackQueue<int> queue;

  setUp(() {
    queue = DoubleStackQueue<int>();
  });
  group('Enqueue tests', () {
    test('Elements are enqueued in the correct order', () {
      final enqueuedElements = <int>[];

      for (int i = 0; i < 10; ++i) {
        queue.enqueue(i);
        enqueuedElements.add(i);
      }

      final queueElements = queue.elements;
      expect(queueElements, enqueuedElements);
    });
  });

  group('Dequeue tests', () {
    test('Elements are dequeued in the same order they have been enqueued', () {
      final enqueuedElements = <int>[];

      for (int i = 0; i < 10; ++i) {
        queue.enqueue(i);
        enqueuedElements.add(i);
      }

      final dequeuedElements = <int>[];
      while (!queue.isEmpty()) {
        dequeuedElements.add(queue.dequeue());
      }

      expect(dequeuedElements, enqueuedElements);
    });
  });

  group('Emptiness tests', () {
    test('isEmpty returns true if queue is empty', () {
      expect(queue.isEmpty(), isTrue);

      queue.enqueue(1);
      queue.dequeue();

      expect(queue.isEmpty(), isTrue);
    });

    test('isEmpty returns false if queue is not empty', () {
      expect(queue.isEmpty(), isTrue);

      queue.enqueue(1);
      expect(queue.isEmpty(), isFalse);

      queue.dequeue();
      expect(queue.isEmpty(), isTrue);
    });
  });
}
