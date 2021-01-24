import 'package:dart_data_structures/trees/helpers/bst/bst_node_constructor.dart';
import 'package:dart_data_structures/trees/helpers/bst/bst_node_inserter.dart';
import 'package:dart_data_structures/trees/nodes/binary_node.dart';
import 'package:flutter/foundation.dart';

class BSTRecursiveNodeInserter<T extends Comparable>
    implements BSTNodeInserter<T> {
  BSTRecursiveNodeInserter(this.nodeConstructor);

  final BSTNodeConstructor<T> nodeConstructor;

  @override
  BinaryNode<T> insert({@required BinaryNode<T> root, @required T value}) {
    if (root == null) {
      return nodeConstructor.constructInstance(value);
    }

    if (value.compareTo(root.value) >= 0) {
      root.right = insert(root: root.right, value: value);
    } else {
      root.left = insert(root: root.left, value: value);
    }

    return root;
  }
}
