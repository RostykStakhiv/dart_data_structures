import 'package:dart_data_structures/trees/nodes/trie_node.dart';

class Trie<ValueType extends Iterable> {
  final TrieNode _root = TrieNode(
    key: null,
    parentNode: null,
    isTerminating: false,
  );

  bool get isEmpty => _root.children.isEmpty;

  bool get isNotEmpty => _root.children.isNotEmpty;

  void insert(ValueType collection) {
    TrieNode curNode = _root;

    int curIndex = 0;

    for (final element in collection) {
      if (curNode.children[element] == null) {
        curNode.children[element] = TrieNode(
            key: element,
            parentNode: curNode,
            isTerminating: curIndex == collection.length - 1);
      }

      curNode = curNode.children[element];
      ++curIndex;
    }
  }

  bool contains(ValueType collection) {
    TrieNode curNode = _root;

    for (final element in collection) {
      if (curNode.children[element] == null) {
        return false;
      }

      curNode = curNode.children[element];
    }

    return curNode.isTerminating;
  }

  void remove(ValueType collection) {
    TrieNode curNode = _root;

    for (final element in collection) {
      curNode = curNode.children[element];

      if (curNode == null) {
        return;
      }
    }

    curNode.isTerminating = !curNode.isTerminating;

    TrieNode parent = curNode.parentNode;
    while (
        parent != null && curNode.children.isEmpty && !curNode.isTerminating) {
      parent.children.remove(curNode.key);
      curNode = parent;
      parent = parent.parentNode;
    }
  }
}
