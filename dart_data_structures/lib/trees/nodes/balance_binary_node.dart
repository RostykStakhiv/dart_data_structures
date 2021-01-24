import 'package:dart_data_structures/trees/nodes/binary_node.dart';
import 'package:flutter/foundation.dart';

class BalanceBinaryNode<T> extends BinaryNode<T> {
  BalanceBinaryNode({
    @required T value,
    BalanceBinaryNode<T> left,
    BalanceBinaryNode<T> right,
  }) : super(
          value: value,
          left: left,
          right: right,
        );

  int height = 0;

  int get balanceFactor => leftHeight - rightHeight;

  int get leftHeight => (left as BalanceBinaryNode)?.height ?? -1;
  int get rightHeight => (right as BalanceBinaryNode)?.height ?? -1;
}
