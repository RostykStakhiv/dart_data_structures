import 'package:dart_data_structures/trees/binary_node.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BinaryNode<int> root;

  setUp(() {
    root = BinaryNode(value: 40);
    root.left = BinaryNode(value: 18);
    root.left.left = BinaryNode(value: 1);
    root.left..left.right = BinaryNode(value: 4);

    root.left.right = BinaryNode(value: 20);
    root.left.right.right = BinaryNode(value: 25);

    root.right = BinaryNode(value: 77);
    root.right.left = BinaryNode(value: 70);
    root.right.left.left = BinaryNode(value: 45);

    root.right.right = BinaryNode(value: 105);
    root.right.right.left = BinaryNode(value: 88);
  });

  group('In-order traversal tests', () {
    test('In-order traversal when having multiple children', () {
      final List<BinaryNode<int>> inOrderNodes = [
        root.left.left,
        root.left.left.right,
        root.left,
        root.left.right,
        root.left.right.right,
        root,
        root.right.left.left,
        root.right.left,
        root.right,
        root.right.right.left,
        root.right.right,
      ];

      var traversedNodes = List<BinaryNode>();
      root.inOrderTraversal((node) {
        traversedNodes.add(node);
      });

      expect(traversedNodes, inOrderNodes);
    });
  });

  group('Pre-order traversal testing', () {
    test('Pre-order traversal when having multiple children', () {
      final List<int> preOrderValues = [40, 18, 1, 4, 20, 25, 77, 70, 45, 105, 88];

      var traversedValues = List<int>();
      root.preOrderTraversal((node) {
        traversedValues.add(node.value);
      });

      expect(traversedValues, preOrderValues);
    });
  });

  group('Post-order traversal testing', () {
    test('Post-order traversal when having multiple children', () {
      final List<int> preOrderValues = [4, 1, 25, 20, 18, 45, 70, 88, 105, 77, 40];

      var traversedValues = List<int>();
      root.postOrderTraversal((node) {
        traversedValues.add(node.value);
      });

      expect(traversedValues, preOrderValues);
    });
  });
}
