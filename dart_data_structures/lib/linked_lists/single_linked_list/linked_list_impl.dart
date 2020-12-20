part of 'linked_list.dart';

class LinkedList<T> implements List<T> {
  ListNode head;
  ListNode tail;

  @override
  bool isEmpty() => head == null;

  @override
  void append(T element) {
    final newNode = ListNode(element);

    if (isEmpty()) {
      head = newNode;
      tail = head;
      return;
    }

    tail.next = newNode;
    tail = tail.next;
  }

  @override
  void prepend(T element) {
    final newNode = ListNode(element);

    if (isEmpty()) {
      head = newNode;
      tail = head;
      return;
    }

    newNode.next = head;
    head = newNode;
  }

  @override
  void insertAt(int index, T value) {
    if(index == 0) {
      prepend(value);
    }
    final nodeToInsertAfter = nodeAtIndex(index - 1);
    insertAfter(nodeToInsertAfter, value);
  }

  void insertAfter(ListNode node, T value) {
    final newNode = ListNode(value, next: node?.next);
    node?.next = newNode;

    if(node == tail) {
      tail = node;
    }
  }

  @override
  ListNode<T> nodeAtIndex(int index) {
    if (index < 0) {
      return null;
    }

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
    if (head == tail) {
      head = tail = null;
    } else {
      head = head.next;
    }

    return removedValue;
  }

  @override
  T removeLast() {
    if (isEmpty()) {
      return null;
    }

    if (head == tail) {
      return removeFirst();
    }

    ListNode prev = head;
    ListNode cur = head.next;

    while (cur?.next != null) {
      prev = cur;
      cur = cur.next;
    }

    prev.next = null;
    tail = prev;

    return cur.value;
  }

  T removeAfter(ListNode node) {
    if (node?.next == tail) {
      tail = node;
    }

    final removedValue = node?.next?.value;

    node?.next = node?.next?.next;
    return removedValue;
  }

  @override
  T removeAt(int index) {
    if (head == tail) {
      return removeFirst();
    }

    return removeAfter(nodeAtIndex(index - 1));
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
