import 'dart:math';

import 'package:dart_data_structures/trees/heap.dart';
import '../helpers/heap_utils.dart';
import 'package:flutter_test/flutter_test.dart';

Heap<int> heap;

void main() {
  group('Heap creation tests', () {
    final initialValues = List<int>.empty(growable: true);
    group('Max Heap creation tests', () {
      test(
          'Max Heap created with a list of random elements sorts them correclty',
          () {
        for (int i = 0; i < 50; ++i) {
          initialValues.add(Random().nextInt(60));
        }

        heap = Heap<int>.max(initialValues: initialValues);
        expect(
            checkIfListIsValidMaxHeap(
              heap.elements,
              leftChildIndexProvider: Heap.leftChildIndexForParentAtIndex,
              rightChildIndexProvider: Heap.rightChildIndexForParentAtIndex,
            ),
            isTrue);
      });
    });

    group('Min Heap creation tests', () {
      test(
          'Min Heap created with a list of random elements sorts them correclty',
          () {
        for (int i = 0; i < 50; ++i) {
          initialValues.add(Random().nextInt(60));
        }

        heap = Heap<int>.min(initialValues: initialValues);
        expect(
            checkIfListIsValidMinHeap(
              heap.elements,
              leftChildIndexProvider: Heap.leftChildIndexForParentAtIndex,
              rightChildIndexProvider: Heap.rightChildIndexForParentAtIndex,
            ),
            isTrue);
      });
    });
  });
  group('Heap Deletion Tests', () {
    group('Max Heap deletion tests', () {
      const highestPriorityElement = 50;
      const heapSize = 20;

      setUp(() {
        final initialElements = _randomList(heapSize, highestPriorityElement);
        initialElements.add(highestPriorityElement);
        heap = Heap.max(initialValues: initialElements);
      });

      test('Highest priority element gets deleted after calling remove method',
          () {
        final removedElement = heap.remove();
        expect(removedElement, highestPriorityElement);
      });

      test(
          'Only one element gets deleted when calling remove method on non-empty heap',
          () {
        expect(heap.length, greaterThan(0));
        final heapSizeBeforeDeletion = heap.length;
        heap.remove();
        final heapSizeAfterDeletion = heap.length;

        expect(heapSizeBeforeDeletion - heapSizeAfterDeletion, 1);
      });

      test('Heap is still a valid Max Heap after removing max element', () {
        heap.remove();
        expect(
          checkIfListIsValidMaxHeap(
            heap.elements,
            leftChildIndexProvider: Heap.leftChildIndexForParentAtIndex,
            rightChildIndexProvider: Heap.rightChildIndexForParentAtIndex,
          ),
          isTrue,
        );
      });
    });
  });

  group('Heap Insertion tests', () {
    group('Max Heap Insertion tests', () {
      const highestPriorityElement = 50;
      const heapSize = 20;

      setUp(() {
        final initialElements = _randomList(heapSize, highestPriorityElement);
        initialElements.add(highestPriorityElement);
        heap = Heap.max(initialValues: initialElements);
      });
      test('After inserting an element Heap is still a valid Max Heap', () {
        heap.insert(Random().nextInt(highestPriorityElement));

        expect(
          checkIfListIsValidMaxHeap(
            heap.elements,
            leftChildIndexProvider: Heap.leftChildIndexForParentAtIndex,
            rightChildIndexProvider: Heap.rightChildIndexForParentAtIndex,
          ),
          isTrue,
        );
      });

      test('After inserting an element Heap size is increased by 1', () {
        final sizeBeforeInsertion = heap.length;
        heap.insert(20);
        final sizeAfterInsertion = heap.length;

        expect((sizeBeforeInsertion - sizeAfterInsertion).abs(), 1);
      });

      test('After inserting a new max element is gets positioned as the peek',
          () {
        final newMaxElement = highestPriorityElement + 1;
        heap.insert(newMaxElement);
        expect(newMaxElement, heap.peek());
      });
    });
  });
}

List<int> _randomList(int size, int maxElement) {
  var initialElements = <int>[];
  for (int i = 0; i < size; ++i) {
    initialElements.add(Random().nextInt(maxElement));
  }

  return initialElements;
}
