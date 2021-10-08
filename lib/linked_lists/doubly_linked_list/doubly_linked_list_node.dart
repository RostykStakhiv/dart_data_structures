part of 'doubly_linked_list.dart';

class DoublyLinkedListNode<T> extends ListNode<T> {
  DoublyLinkedListNode(
    T value, {
    DoublyLinkedListNode<T> next,
    this.prev,
  }) : super(value, next: next);

  DoublyLinkedListNode prev;
}
