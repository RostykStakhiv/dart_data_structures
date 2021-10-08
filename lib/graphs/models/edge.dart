part of '../graphs.dart';

class Edge<T> {
  const Edge({
    @required this.source,
    @required this.destination,
    this.weight,
  });
  
  final Vertex<T> source;
  final Vertex<T> destination;
  final double weight;
}
