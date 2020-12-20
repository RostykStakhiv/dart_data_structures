part of 'doubly_linked_list.dart';

class DoublyLinkedList<T> extends List<T> {
  DoublyLinkedListNode<T> head;
  DoublyLinkedListNode<T> tail;

  @override
  bool isEmpty() => head == null;

  @override
  void append(T element) {
    final newNode = DoublyLinkedListNode(element);

    if (isEmpty()) {
      _initializeList(newNode);
      return;
    }

    tail.next = newNode;
    newNode.prev = tail;
    tail = newNode;
  }

  @override
  void prepend(T element) {
    final newNode = DoublyLinkedListNode(element, next: head);

    if (isEmpty()) {
      _initializeList(newNode);
      return;
    }

    head.prev = newNode;
    head = newNode;
  }

  @override
  void insertAt(int index, T value) {
    final foundNode = nodeAtIndex(index);

    if (foundNode == head) {
      prepend(value);
      return;
    }

    if (foundNode == tail) {
      append(value);
      return;
    }

    final nodeBeforeFoundNode = foundNode?.prev;

    final newNode =
        DoublyLinkedListNode(value, next: foundNode, prev: nodeBeforeFoundNode);

    foundNode?.prev = newNode;
    nodeBeforeFoundNode?.next = newNode;
  }

  void insertAfter(DoublyLinkedListNode<T> node, T value) {}

  @override
  DoublyLinkedListNode<T> nodeAtIndex(int index) {
    var curIndex = 0;
    var curNode = head;

    while (curNode != null && curIndex < index) {
      curNode = curNode.next;
      ++curIndex;
    }

    return curNode;
  }

  @override
  T removeFirst() {
    if (isEmpty()) {
      return null;
    }

    final removedValue = head.value;
    head = head.next;
    head?.prev = null;

    return removedValue;
  }

  @override
  T removeLast() {
    if (isEmpty()) {
      return null;
    }

    final removedValue = tail.value;
    tail = tail.prev;
    tail?.next = null;

    return removedValue;
  }

  @override
  T removeAt(int index) {
    throw UnimplementedError();
  }

  void _initializeList(DoublyLinkedListNode<T> initialNode) {
    head = initialNode;
    tail = head;
  }

  @override
  void iterate(ListIteratorCallback<T> iteratorCallback) {
    var curNode = head;
    while (curNode != null) {
      iteratorCallback(curNode.value);
      curNode = curNode.next;
    }
  }

  @override
  T peek() => tail?.value;
}
