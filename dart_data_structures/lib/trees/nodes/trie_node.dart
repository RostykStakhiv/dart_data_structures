import 'package:flutter/foundation.dart';

class TrieNode<ValueType> {
  final ValueType key;

  Map<ValueType, TrieNode> children = Map<ValueType, TrieNode>();

  final TrieNode<ValueType> parentNode;

  bool isTerminating;

  TrieNode({
    @required this.key,
    @required this.parentNode,
    @required this.isTerminating,
    this.children,
  }) {
    if(children == null) {
      children = Map<ValueType, TrieNode>();
    }
  }
}
