import 'package:dart_data_structures/linked_lists/doubly_linked_list/doubly_linked_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isEmpty tests', () {
    test('Calling isEmpty() on an empty list returns true', () {
      final list = DoublyLinkedList<int>();
      expect(list.isEmpty(), isTrue);
    });

    test('Calling isEmpty() on a list that has one elements returns false', () {
      final list = DoublyLinkedList<int>();
      list.append(1);
      expect(list.isEmpty(), isFalse);
    });

    test(
        'Calling isEmpty() on a list that has more than one elements returns false',
        () {
      final list = DoublyLinkedList<int>();
      list.append(1);
      list.append(2);
      expect(list.isEmpty(), isFalse);
    });
  });

  group('Insert tests', () {
    test('Calling prepend() adds elements to the beginning of the list', () {
      final list = DoublyLinkedList<int>();

      const elementsToInsert = [1, 2, 3, 4, 5];
      for (final el in elementsToInsert) {
        list.prepend(el);
      }

      final listElements = <int>[];
      list.iterate((value) {
        listElements.add(value);
      });

      expect(listElements, elementsToInsert.reversed);
    });

    test('Calling append() adds elements to the end of the list', () {
      final list = DoublyLinkedList<int>();

      const elementsToInsert = [1, 2, 3, 4, 5];
      for (final el in elementsToInsert) {
        list.append(el);
      }

      final listElements = <int>[];
      list.iterate((value) {
        listElements.add(value);
      });

      expect(listElements, elementsToInsert);
    });
  });

  group('Remove tests', () {
    test('Calling removeFirst() removes first element from the list', () {
      final list = DoublyLinkedList<int>();
      const elementsToInsert = [1, 2, 3, 4, 5];

      for (final el in elementsToInsert) {
        list.append(el);
      }

      final removedElements = <int>[];

      for (int i = 0; i < elementsToInsert.length; ++i) {
        removedElements.add(list.removeFirst());
      }

      expect(removedElements, elementsToInsert);
    });

    test('Calling removeLast() removes last element from the list', () {
      final list = DoublyLinkedList<int>();
      const elementsToInsert = [1, 2, 3, 4, 5];

      for (final el in elementsToInsert) {
        list.append(el);
      }

      final removedElements = <int>[];

      for (int i = 0; i < elementsToInsert.length; ++i) {
        removedElements.add(list.removeLast());
      }

      expect(removedElements, elementsToInsert.reversed);
    });
  });

  test('Iterate method visits nodes in correct order', () {
    final list = DoublyLinkedList<int>();
    final elements = [1, 2, 3, 4, 5];

    for (final el in elements) {
      list.append(el);
    }

    var iteratedElements = <int>[];
    list.iterate((value) {
      iteratedElements.add(value);
    });

    expect(iteratedElements, elements);
  });

  //TODO(rostyslav.stakhiv): Add tests for index-based methods
}
