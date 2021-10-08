part of '../queue.dart';

abstract class Dequeue<T> extends Queue<T> {
  void enqueueFirst(T element);
  T dequeueLast();

  T peekLast();
}