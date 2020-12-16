import 'package:dart_data_structures/trees/heap.dart';
import 'package:flutter_test/flutter_test.dart';

import 'heap_utils.dart';

const validMaxHeapList = [8, 7, 5, 6, 3, 2, 1, 4];
const invalidMaxHeap = [4, 7, 5, 6, 3, 2, 1, 8];

const validMinHeap = [1, 2, 10, 3, 5, 14, 13];
const invalidMinHeap = [1, 5, 10, 3, 2, 14, 13];

void main() {
  group('Max Heap validation tests', () {
    test('Heap validator returns true if list IS a valid heap', () {
      final res = checkIfListIsValidMaxHeap<int>(
        validMaxHeapList,
        leftChildIndexProvider: (parentIndex) =>
            Heap.leftChildIndexForParentAtIndex(parentIndex),
        rightChildIndexProvider: (parentIndex) =>
            Heap.rightChildIndexForParentAtIndex(parentIndex),
      );

      expect(res, isTrue);
    });

    test('Heap validator returns false if list IS NOT a valid heap', () {
      final res = checkIfListIsValidMaxHeap<int>(
        invalidMaxHeap,
        leftChildIndexProvider: (parentIndex) =>
            Heap.leftChildIndexForParentAtIndex(parentIndex),
        rightChildIndexProvider: (parentIndex) =>
            Heap.rightChildIndexForParentAtIndex(parentIndex),
      );

      expect(res, isFalse);
    });
  });

  group('Min Heap validation tests', () {
    test('Heap validator returns true if list IS a valid heap', () {
      final res = checkIfListIsValidMinHeap<int>(
        validMinHeap,
        leftChildIndexProvider: (parentIndex) =>
            Heap.leftChildIndexForParentAtIndex(parentIndex),
        rightChildIndexProvider: (parentIndex) =>
            Heap.rightChildIndexForParentAtIndex(parentIndex),
      );

      expect(res, isTrue);
    });

    test('Heap validator returns false if list IS NOT a valid heap', () {
      final res = checkIfListIsValidMinHeap<int>(
        invalidMinHeap,
        leftChildIndexProvider: (parentIndex) =>
            Heap.leftChildIndexForParentAtIndex(parentIndex),
        rightChildIndexProvider: (parentIndex) =>
            Heap.rightChildIndexForParentAtIndex(parentIndex),
      );

      expect(res, isFalse);
    });
  });
}
