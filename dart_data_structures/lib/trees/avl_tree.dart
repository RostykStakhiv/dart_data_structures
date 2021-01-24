import 'package:dart_data_structures/trees/binary_search_tree.dart';
import 'package:dart_data_structures/trees/nodes/balance_binary_node.dart';

class AVLTree<T extends Comparable> extends BinarySearchTree<T> {
  BalanceBinaryNode<T> _root;

  @override
  void insert(T value) {
    //_root = insertFrom(root: _root, value: value);
  }

  @override
  void remove(T value) {
  }
}
