import 'package:dart_data_structures/trees/helpers/bst/bst_node_constructor.dart';
import 'package:dart_data_structures/trees/nodes/binary_node.dart';
import 'package:flutter/foundation.dart';

abstract class BSTNodeInserter<T extends Comparable> {
  BSTNodeInserter(BSTNodeConstructor<T> nodeConstructor);
  BinaryNode<T> insert({@required BinaryNode<T> root, @required T value});
}
