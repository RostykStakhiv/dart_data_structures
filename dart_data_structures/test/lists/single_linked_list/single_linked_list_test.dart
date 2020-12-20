import 'package:dart_data_structures/linked_lists/single_linked_list/linked_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isEmpty tests', () {
    test('isEmpty returns true if list is empty', () {
      final linkedList = LinkedList();
      expect(linkedList.isEmpty(), isTrue);
    });

    test('isEmpty returns false if list has 1 element', () {
      final linkedList = LinkedList<int>();
      linkedList.append(1);

      expect(linkedList.isEmpty(), isFalse);
    });

    test('isEmpty returns false if list has more than 1 element', () {
      final linkedList = LinkedList<int>();
      linkedList.append(1);
      linkedList.append(2);

      expect(linkedList.isEmpty(), isFalse);
    });
  });
  group('Insert tests', () {
    test('Calling append() method inserts elements to the end of the list', () {
      final list = LinkedList<int>();
      var elementsToInsert = [1, 2, 3, 4, 5, 6];
      for (final el in elementsToInsert) {
        list.append(el);
      }

      var listElements = <int>[];
      list.iterate((value) {
        listElements.add(value);
      });

      expect(elementsToInsert, listElements);
    });

    test(
        'Calling prepend() method inserts elements to the beginning of the list',
        () {
      final list = LinkedList<int>();
      var elementsToInsert = [1, 2, 3, 4, 5, 6];
      for (final el in elementsToInsert) {
        list.prepend(el);
      }

      var listElements = <int>[];
      list.iterate((value) {
        listElements.add(value);
      });

      expect(elementsToInsert.reversed, listElements);
    });

    group('InsertAt tests', () {
      const elementToInsert = 5;
      test(
          'Calling insertAt() method with insert index being equal to 0 inserts elements to the beginning of the list',
          () {
        final list = LinkedList<int>();
        final elementsToInsert = [1, 2, 3, 4, 5];
        for (final el in elementsToInsert) {
          list.insertAt(0, el);
        }
        var listElements = <int>[];

        list.iterate((value) {
          listElements.add(value);
        });

        expect(listElements, elementsToInsert.reversed);
      });

      test(
          'Calling insertAt() method with insert index being out-of-range does not insert elements',
          () {
        final list = LinkedList<int>();
        var listElements = <int>[];

        list.insertAt(1, elementToInsert);
        list.iterate((value) {
          listElements.add(value);
        });

        expect(listElements, []);

        listElements.clear();
        list.insertAt(-1, elementToInsert);
        list.iterate((value) {
          listElements.add(value);
        });

        expect(listElements, []);
      });

      test(
          'Calling insertAt() method on a non-empty list with insert index being in proper range insers element at correct position',
          () {
        final list = LinkedList<int>();
        list.append(1);
        list.append(2);

        list.insertAt(1, 4);

        var listElements = <int>[];

        list.iterate((value) {
          listElements.add(value);
        });

        expect(listElements, [1, 4, 2]);
      });
    });
  });

  group('Remove tests', () {
    test('Calling removeFirst() method removes first element from the list',
        () {
      final list = LinkedList<int>();
      final elementsToInsert = [1, 2, 3, 4, 5];

      for (final el in elementsToInsert) {
        list.append(el);
      }

      final removedElements = <int>[];

      for (int i = 0; i < elementsToInsert.length; ++i) {
        removedElements.add(list.removeFirst());
      }

      expect(removedElements, elementsToInsert);
    });

    test('Calling removeLast() method removes last element from the list', () {
      final list = LinkedList<int>();
      final elementsToInsert = [1, 2, 3, 4, 5];

      for (final el in elementsToInsert) {
        list.append(el);
      }

      final removedElements = <int>[];

      for (int i = 0; i < elementsToInsert.length; ++i) {
        removedElements.add(list.removeLast());
      }

      expect(removedElements, elementsToInsert.reversed);
    });

    test('Calling removeAt() method removes element at correct position', () {
      final list = LinkedList<int>();
      final elementsToInsert = [1, 2, 3, 4, 5];

      for (final el in elementsToInsert) {
        list.append(el);
      }

      const removeIndex = 1;
      final removedElement = list.removeAt(removeIndex);

      expect(removedElement, elementsToInsert[removeIndex]);
    });
  });

  test('Iterate method visits nodes in correct order', () {
    final list = LinkedList<int>();
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
