part of 'queue.dart';

class DoubleStackQueue<T> implements Queue<T> {
  List<T> writeStack = List<T>.empty(growable: true);
  List<T> readStack = List<T>.empty(growable: true);

  @override
  bool isEmpty() => writeStack.isEmpty && readStack.isEmpty;

  @override
  void enqueue(T element) => writeStack.add(element);

  @override
  T dequeue() {
    _prepareReadStack();
    return readStack.removeLast();
  }

  @override
  T peek() {
    _prepareReadStack();
    return readStack.last;
  }

  @override
  List<T> get elements {
    final queueElements = readStack.reversed.toList();
    queueElements.addAll(writeStack);
    return queueElements;
  }

  void _prepareReadStack() {
    if (readStack.isEmpty) {
      readStack = writeStack.reversed.toList();
      writeStack = List<T>.empty(growable: true);
    }
  }
}
