import 'package:dart_data_structures/exceptions/trees/tree_node_exceptions.dart';
import 'package:dart_data_structures/trees/binary_node.dart';
import 'package:flutter/cupertino.dart';

class BinarySearchTree<ValueType extends Comparable> {
  BinaryNode<ValueType> _root;

  BinaryNode<ValueType> _insertFrom(
      {@required BinaryNode root, @required ValueType value}) {
    if (value == null) {
      throw TryingToAddNullException();
    }

    if (root == null) {
      return BinaryNode(value: value);
    }

    if (value.compareTo(root.value) < 0) {
      //root value is bigger then the inserted value
      root.left = _insertFrom(root: root.left, value: value);
    } else {
      root.right = _insertFrom(root: root.right, value: value);
    }

    return root;
  }

  void insert(ValueType value) {
    _root = _insertFrom(root: _root, value: value);
  }

  bool contains(ValueType value) {
    BinaryNode<ValueType> curNode = _root;

    while (curNode != null) {
      if (curNode.value == value) {
        return true;
      }

      if (value.compareTo(curNode.value) < 0) {
        curNode = curNode.left;
      } else {
        curNode = curNode.right;
      }
    }

    return false;
  }

  void remove(ValueType value) {
    _root = _remove(rootNode: _root, value: value);
  }

  BinaryNode<ValueType> _remove(
      {@required BinaryNode<ValueType> rootNode, @required ValueType value}) {
    if (rootNode == null) {
      return null;
    }

    if (value == rootNode.value) {
      if (rootNode.left == null && rootNode.right == null) {
        //If node has no children - simply remove the node
        return null;
      }

      if (rootNode.left == null) {
        //If node has only one child - return that child
        return rootNode.right;
      }

      if (rootNode.right == null) {
        return rootNode.left;
      }

      //If node has 2 children we need to swap node we want to remove with the node
      final newRootNode =
          BinaryNode(value: rootNode.minValueNode.value, left: rootNode.left, right: rootNode.right);

      newRootNode.right = _remove(rootNode: newRootNode.right, value: newRootNode.value);
      rootNode = newRootNode;
    } else if (value.compareTo(rootNode.value) < 0) {
      rootNode.left = _remove(rootNode: rootNode.left, value: value);
    } else {
      rootNode.right = _remove(rootNode: rootNode.right, value: value);
    }

    return rootNode;
  }
}
