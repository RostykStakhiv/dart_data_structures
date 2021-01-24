part of 'bst_iterators.dart';

abstract class BSTIterator<T extends Comparable> {
  BSTIterator(BinaryNode<T> root);
  BinaryNode<T>nextNode();
}