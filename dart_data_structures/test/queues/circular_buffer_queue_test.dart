import 'package:dart_data_structures/queues/queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const queueSize = 5;
  group('Enqueue tests', () {
    test('Elements get enqueued into the queue after calling enqueue() method', () {
      final queue = CircularBufferQueue<int>(size: queueSize);

      final enqueuedElements = <int>[];
      for(int i = 0; i < queueSize; ++i) {
        queue.enqueue(i);
        enqueuedElements.add(i);
      }

      final elementsAddedToTheQueue = queue.elements;
      expect(elementsAddedToTheQueue, enqueuedElements);
    });
  });
}