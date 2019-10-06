import 'package:dart_data_structures/typedefs/tree_typedefs.dart';
import 'package:flutter/cupertino.dart';

class BinaryNode<ValueType> {
  final ValueType value;
  BinaryNode<ValueType> left;
  BinaryNode<ValueType> right;

  BinaryNode({@required this.value});

  void inOrderTraversal(NodeVisitCallback<BinaryNode<ValueType>> visit) {
    left?.inOrderTraversal(visit);
    visit(this);
    right?.inOrderTraversal(visit);
  }

  void preOrderTraversal(NodeVisitCallback<BinaryNode<ValueType>> visit) {
    visit(this);
    left?.preOrderTraversal(visit);
    right?.preOrderTraversal(visit);
  }

  void postOrderTraversal(NodeVisitCallback<BinaryNode<ValueType>> visit) {
    left?.postOrderTraversal(visit);
    right?.postOrderTraversal(visit);
    visit(this);
  }
}