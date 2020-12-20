import 'package:flutter/material.dart';

typedef ChildIndexProvider = int Function(int parentIndex);
typedef ParentIndexProvider = int Function(int childIndex);

typedef HeapElementsComparer<T extends Comparable> = bool Function(T, T);

bool checkIfListIsValidMaxHeap<T extends Comparable>(
  List<T> list, {
  @required ChildIndexProvider leftChildIndexProvider,
  @required ChildIndexProvider rightChildIndexProvider,
  int initialParentIndex = 0,
}) =>
    _isListValidHeap<T>(list,
        leftChildIndexProvider: leftChildIndexProvider,
        rightChildIndexProvider: rightChildIndexProvider,
        initialParentIndex: initialParentIndex,
        validHeapComparerFunc: (el1, el2) => el1.compareTo(el2) >= 0);

bool checkIfListIsValidMinHeap<T extends Comparable>(
  List<T> list, {
  @required ChildIndexProvider leftChildIndexProvider,
  @required ChildIndexProvider rightChildIndexProvider,
  int initialParentIndex = 0,
}) =>
    _isListValidHeap<T>(list,
        leftChildIndexProvider: leftChildIndexProvider,
        rightChildIndexProvider: rightChildIndexProvider,
        initialParentIndex: initialParentIndex,
        validHeapComparerFunc: (el1, el2) => el1.compareTo(el2) <= 0);

bool _isListValidHeap<T extends Comparable>(
  List<T> list, {
  @required ChildIndexProvider leftChildIndexProvider,
  @required ChildIndexProvider rightChildIndexProvider,
  @required HeapElementsComparer validHeapComparerFunc,
  int initialParentIndex = 0,
}) {
  var parentIndex = initialParentIndex;
  var leftChildIndex = leftChildIndexProvider(parentIndex);
  var rightChildIndex = rightChildIndexProvider(parentIndex);

  while (leftChildIndex < list.length) {
    if (!validHeapComparerFunc(list[parentIndex], list[leftChildIndex])) {
      return false;
    }

    if (rightChildIndex < list.length &&
        !validHeapComparerFunc(list[parentIndex], list[leftChildIndex])) {
      return false;
    }

    ++parentIndex;
    leftChildIndex = leftChildIndexProvider(parentIndex);
    rightChildIndex = rightChildIndexProvider(parentIndex);
  }

  return true;
}
