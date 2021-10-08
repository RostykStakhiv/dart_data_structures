part of 'queue.dart';

class CircularBufferQueue<T> implements Queue<T> {
  CircularBufferQueue({@required int size})
      : _circularBuffer = CircularBuffer<T>(size: size);

  CircularBuffer<T> _circularBuffer;

  @override
  bool isEmpty() {
    return _circularBuffer.isEmpty();
  }

  @override
  void enqueue(T element) => _circularBuffer.write(element);

  @override
  T dequeue() => _circularBuffer.read();

  @override
  T peek() => _circularBuffer.peek();

  List<T> get elements {
    final queueElements = <T>[];
    _circularBuffer.iterate((value) {
      queueElements.add(value);
    });

    return queueElements;
  }
}
