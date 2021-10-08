part of 'queue.dart';

abstract class Queue<T> {
  bool isEmpty();
  void enqueue(T element);
  T dequeue();
  T peek();
}