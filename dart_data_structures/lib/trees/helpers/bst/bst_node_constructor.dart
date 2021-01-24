import 'package:dart_data_structures/trees/nodes/binary_node.dart';

class BSTNodeConstructor<T extends Comparable> {
  BinaryNode<T> constructInstance(T value) => BinaryNode<T>(value: value);
}
