part of 'queue.dart';

class LinkedListQueue<T> implements Queue<T> {
  LinkedListQueue();

  final list = LinkedList<T>();

  @override
  bool isEmpty() {
    return list.isEmpty();
  }

  @override
  void enqueue(T element) => list.append(element);

  @override
  T dequeue() => list.removeFirst();

  @override
  T peek() => list.peek();

  List<T> get elements {
    final queueElements = <T>[];
    list.iterate((value) {
      queueElements.add(value);
    });

    return queueElements;
  }
}
