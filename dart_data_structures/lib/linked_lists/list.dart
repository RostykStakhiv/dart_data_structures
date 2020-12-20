import 'package:dart_data_structures/linked_lists/single_linked_list/linked_list.dart';

typedef ListIteratorCallback<T> = void Function(T value);

abstract class List<T> {
  bool isEmpty();
  void append(T element);
  void prepend(T element);
  void insertAt(int index, T value);

  ListNode<T> nodeAtIndex(int index);

  T removeFirst();
  T removeLast();
  T removeAt(int index);

  void iterate(ListIteratorCallback<T> iteratorCallback);
}