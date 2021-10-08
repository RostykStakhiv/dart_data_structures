import 'package:flutter/material.dart';

import '../helpers/swap_list.dart';

typedef HeapSortFunc<ValueType extends Comparable> = bool Function(
    ValueType el1, ValueType el2);

class Heap<ValueType extends Comparable> {
  Heap._sortFunc(this._sortFunc, {this.elements}) {
    if (elements == null) {
      elements = List<ValueType>.empty(growable: true);
    }

    for (int i = length ~/ 2; i >= 0; --i) {
      siftDownFrom(i);
    }
  }

  factory Heap.max({List<ValueType> initialValues}) =>
      Heap._sortFunc((el1, el2) => el1.compareTo(el2) > 0,
          elements: initialValues);

  factory Heap.min({List<ValueType> initialValues}) =>
      Heap._sortFunc((el1, el2) => el1.compareTo(el2) < 0,
          elements: initialValues);

  List<ValueType> elements = List.empty();
  final HeapSortFunc<ValueType> _sortFunc;

  bool get isEmpty => elements.isEmpty;
  int get length => elements.length;
  ValueType peek() => elements.first;
  static int leftChildIndexForParentAtIndex(int parentIndex) =>
      2 * parentIndex + 1;
  static int rightChildIndexForParentAtIndex(int parentIndex) =>
      2 * parentIndex + 2;
  static int parentIndexOf(int childIndex) => (childIndex - 1) ~/ 2;

  ValueType remove() {
    if (isEmpty) {
      return null;
    }

    final elementToRemoveIndex = 0;
    final lowestPriorityElementIndex = elements.length - 1;

    elements.swap(elementToRemoveIndex, lowestPriorityElementIndex);
    final removedElement = elements.removeLast();

    siftDownFrom(0);

    return removedElement;
  }

  ValueType reomveAtIndex(int index) {
    if (index < 0 || index > length - 1) {
      return null;
    }

    if (index == length - 1) {
      return elements.removeLast();
    }

    elements.swap(index, length - 1);
    final removedElement = elements.removeLast();

    siftDownFrom(index);
    siftUpFrom(index);

    return removedElement;
  }

  int indexOf({
    @required ValueType value,
    @required int startingAt,
  }) {
    if (startingAt > length - 1) {
      return null;
    }
    if (_sortFunc(value, elements[startingAt])) {
      return null;
    }
    if (value == elements[startingAt]) {
      return startingAt;
    }
    var searchedIndex = indexOf(
        value: value,
        startingAt: Heap.leftChildIndexForParentAtIndex(startingAt));
    if (searchedIndex != null) {
      return searchedIndex;
    }

    searchedIndex = indexOf(
        value: value,
        startingAt: Heap.rightChildIndexForParentAtIndex(startingAt));
    if (searchedIndex != null) {
      return searchedIndex;
    }

    return null;
  }

  void insert(ValueType newValue) {
    elements.add(newValue);
    siftUpFrom(length - 1);
  }

  //Sifting
  void siftDownFrom(int parentIndex) {
    final leftChildIndex = Heap.leftChildIndexForParentAtIndex(parentIndex);
    var rightChildIndex = Heap.rightChildIndexForParentAtIndex(parentIndex);

    var candidateIndex = parentIndex;

    if (leftChildIndex < length &&
        _sortFunc(elements[leftChildIndex], elements[candidateIndex])) {
      candidateIndex = leftChildIndex;
    }

    if (rightChildIndex < length &&
        _sortFunc(elements[rightChildIndex], elements[candidateIndex])) {
      candidateIndex = rightChildIndex;
    }

    if (candidateIndex == parentIndex) {
      return;
    }
    elements.swap(parentIndex, candidateIndex);
    siftDownFrom(candidateIndex);
  }

  void siftUpFrom(int childNodeIndex) {
    var childIndex = childNodeIndex;
    var parentNodeIndex = parentIndexOf(childIndex);

    while (childIndex > 0 &&
        _sortFunc(elements[childIndex], elements[parentNodeIndex])) {
      elements.swap(childIndex, parentNodeIndex);
      childIndex = parentNodeIndex;
      parentNodeIndex = parentIndexOf(childIndex);
    }
  }
}
