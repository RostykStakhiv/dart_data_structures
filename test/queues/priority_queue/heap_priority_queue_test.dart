import 'package:dart_data_structures/queues/queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  HeapPriorityQueue<int> queue;

  setUpAll(() {
    queue = HeapPriorityQueue.max();
  });
  group('Dequeue-enqueu tests', () {
    test('Enqueued elements are dequeued in priority order', () {
      const elementsToEnqueue = [1, 2, 3, 4, 5, 5, 6, 7];
      for (final el in elementsToEnqueue) {
        queue.enqueue(el);
      }

      final dequedElements = <int>[];
      while (!queue.isEmpty()) {
        dequedElements.add(queue.dequeue());
      }

      expect(dequedElements, [7, 6, 5, 5, 4, 3, 2, 1]);
    });

    test('Queue is empty after dequeueing all the elements', () {
      const elementsToEnqueue = [1, 2, 3, 4, 5, 5, 6, 7];
      for (final el in elementsToEnqueue) {
        queue.enqueue(el);
      }

      final dequedElements = <int>[];
      while (!queue.isEmpty()) {
        dequedElements.add(queue.dequeue());
      }

      expect(queue.isEmpty(), isTrue);
    });
  });

  group('Emptiness tests', () {
    test(
        'Calling isEmpty() on a brand new queue with an empty initial elements array returns true',
        () {
      queue = HeapPriorityQueue.max(initialValues: []);
      expect(queue.isEmpty(), isTrue);
    });

    test(
        'Calling isEmpty() on a queue after dequeuing all the elements returns true',
        () {
      queue = HeapPriorityQueue.max(initialValues: [1,2,3,4,5]);
      while(!queue.isEmpty()) {
        queue.dequeue();
      }

      expect(queue.isEmpty(), isTrue);
    });

    test(
        'Calling isEmpty() on a non-empty queue returns false',
        () {
      queue = HeapPriorityQueue.max(initialValues: [1,2,3,4,5]);
      expect(queue.isEmpty(), isFalse);
    });
  });
}
