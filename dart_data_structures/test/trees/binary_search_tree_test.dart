import 'package:dart_data_structures/trees/binary_search_tree.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BinarySearchTree<int> bst;
  const List<int> containedValues = [3, 4, 5, 1, 0, 2];

  setUp(() {
    bst = BinarySearchTree();
    for (final val in containedValues) {
      bst.insert(val);
    }

    print(bst.toString());
  });

  group('Insert tests', () {
    test('Insert into empy tree', () {
      BinarySearchTree<int> myBST = BinarySearchTree();

      myBST.insert(0);
      expect(myBST.contains(0), true);
    });

    test('Insert into non-empy tree', () {
      bst.insert(100);
      expect(bst.contains(100), true);
    });
  });

  group('Contains tests', () {
    test('Contains in empy tree', () {
      BinarySearchTree<int> myBST = BinarySearchTree();
      expect(myBST.contains(0), false);
    });

    test('Contains existing value', () {
      for (final containedVal in containedValues) {
        expect(bst.contains(containedVal), true);
      }
    });
  });

  group('Remove tests', () {
    test('Removes existing value', () {
      expect(bst.contains(containedValues.first), true);

      bst.remove(containedValues.first);

      expect(bst.contains(containedValues.first), false);
    });
  });
}
