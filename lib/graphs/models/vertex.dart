part of '../graphs.dart';

class Vertex<T> {
  const Vertex({this.index, this.value});
  final int index;
  final T value;

  @override
  int get hashCode => index.hashCode;

  @override
  bool operator ==(Object other) {
    return this.hashCode == other.hashCode;
  }
}
