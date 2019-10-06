import 'dart:collection';

import 'package:dart_data_structures/exceptions/trees/tree_node_exceptions.dart';
import 'package:flutter/material.dart';

typedef void NodeVisitCallback(TreeNode node);

enum TraversalType {
  DepthFirst,
  LevelOrder,
}

class TreeNode<ValueType> {
  final ValueType value;

  List<TreeNode<ValueType>> children;

  TreeNode({@required this.value}) {
    if (children == null) {
      children = List<TreeNode<ValueType>>();
    }
  }

  void add(TreeNode<ValueType> node) {
    if (node == null) {
      throw TryingToAddNullException();
    }

    children.add(node);
  }

  void depthFirstTraversal(NodeVisitCallback visit) {
    visit(this);
    children?.forEach((node) {
      node.depthFirstTraversal(visit);
    });
  }

  void levelOrderTraversal(NodeVisitCallback visit) {
    visit(this);

    var queue = Queue<TreeNode<ValueType>>();
    children?.forEach((node) {
      queue.add(node);
    });

    if (queue.length > 0) {
      TreeNode<ValueType> curNode = queue.removeFirst();

      while (curNode != null) {
        visit(curNode);

        curNode.children?.forEach((node) {
          queue.add(node);
        });

        try {
          curNode = queue.removeFirst();
        } catch (ex) {
          curNode = null;
          print(ex.toString());
        }
      }
    }
  }

  TreeNode<ValueType> search(
      {@required ValueType value,
      TraversalType traversalType = TraversalType.DepthFirst}) {
    TreeNode res;

    switch (traversalType) {
      case TraversalType.DepthFirst:
        depthFirstTraversal((node) {
          if (node.value == value) {
            res = node;
          }
        });
        break;
      case TraversalType.LevelOrder:
        levelOrderTraversal((node) {
          if (node.value == value) {
            res = node;
          }
        });
        break;
    }

    return res;
  }
}
