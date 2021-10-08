import 'package:dart_data_structures/queues/queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isEmpty() tests', () {
    test('Calling isEmpty() on an empty queue returns true', () {
      final queue = LinkedListQueue<int>();
      expect(queue.isEmpty(), isTrue);
    });

    test('Calling isEmpty() on a non-empty queue returns false', () {
      final queue = LinkedListQueue<int>();
      queue.enqueue(1);

      expect(queue.isEmpty(), isFalse);
    });
  });

  group('Insert tests', () {
    const elementsToInsert = [1, 2, 3, 4, 5];
    test('Calling enqueue() method adds elements to the end of the queue', () {
      final queue = _createQueueWithElements(elementsToInsert);

      final queueElements = queue.elements;
      expect(queueElements, elementsToInsert);
    });
  });

  group('Remove methods', () {
    const elementsToInsert = [1, 2, 3, 4, 5];

    test(
        'Calling dequeue() method removes elements from the beginning of the queue',
        () {
      final queue = _createQueueWithElements(elementsToInsert);

      final queueElements = queue.elements;

      while (!queue.isEmpty()) {
        queue.dequeue();
        queueElements.removeAt(0);
        expect(queue.elements, queueElements);
      }
    });
    test('Calling dequeue() method removes correct elements', () {
      final queue = _createQueueWithElements(elementsToInsert);

      var dequedElementIndex = 0;

      while (!queue.isEmpty()) {
        final dequedElement = queue.dequeue();
        expect(dequedElement, elementsToInsert[dequedElementIndex]);
        ++dequedElementIndex;
      }
    });
  });

  group('Peek tests', () {
    test('Calling peek() method on an empty queue returns null', () {
      final queue = LinkedListQueue<int>();
      expect(queue.peek(), isNull);
    });

    test('Calling peek() on a queue that has one element returns that element',
        () {
      final queue = LinkedListQueue<int>();
      const firstElement = 1;
      queue.enqueue(firstElement);
      expect(queue.peek(), firstElement);
    });

    test('Calling peek() on a queue that has multiple elements returns the one that has been inserted first',
        () {
      final queue = LinkedListQueue<int>();
      const firstElement = 1;
      const secondElement = 2;
      queue.enqueue(firstElement);
      queue.enqueue(secondElement);
      expect(queue.peek(), firstElement);
    });
  });
}

LinkedListQueue<int> _createQueueWithElements(List<int> initialElements) {
  final queue = LinkedListQueue<int>();

  for (final el in initialElements) {
    queue.enqueue(el);
  }

  return queue;
}
