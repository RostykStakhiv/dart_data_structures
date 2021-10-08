part of '../queue.dart';

class HeapPriorityQueue<T extends Comparable> implements Queue<T> {
  HeapPriorityQueue.max({List<T> initialValues})
      : _heap = Heap.max(initialValues: initialValues);

  HeapPriorityQueue.min({List<T> initialValues})
      : _heap = Heap.min(initialValues: initialValues);

  Heap<T> _heap;

  @override
  bool isEmpty() => _heap.isEmpty;

  @override
  void enqueue(T element) => _heap.insert(element);

  @override
  T dequeue() => _heap.remove();

  @override
  T peek() => _heap.peek();
}
