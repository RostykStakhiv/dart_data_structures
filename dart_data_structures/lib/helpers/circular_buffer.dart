import 'package:flutter/foundation.dart';

typedef CircularBufferIterator<T> = void Function(T element);

class CircularBuffer<T> {
  CircularBuffer({@required int size})
      : this._bufferArray = List<T>.filled(size, null);

  final _bufferArray;
  int _readIndex = 0;
  int _writeIndex = 0;

  int _bufferLength = 0;

  bool isEmpty() => _bufferLength == 0;
  bool isNotEmpty() => !isEmpty();
  bool isFull() => _bufferLength == _bufferArray.length;

  bool write(T element) {
    if (isFull()) {
      return false;
    }

    _bufferArray[_writeIndex % _bufferArray.length] = element;
    ++_writeIndex;
    ++_bufferLength;

    return true;
  }

  T read() {
    if (isEmpty()) {
      return null;
    }

    final element = _bufferArray[_readIndex % _bufferArray.length];
    ++_readIndex;
    --_bufferLength;

    return element;
  }

  T peek() {
    return _bufferArray[_readIndex % _bufferArray.length];
  }

  void iterate(CircularBufferIterator<T> iterator) {
    var tempReadIndex = _readIndex;
    while (tempReadIndex != _writeIndex) {
      iterator(_bufferArray[tempReadIndex % _bufferArray.length]);
      ++tempReadIndex;
    }
  }
}
