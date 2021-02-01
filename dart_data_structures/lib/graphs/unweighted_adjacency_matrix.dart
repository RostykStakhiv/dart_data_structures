part of 'graphs.dart';

class UnweightedAdjacencyMatrix<T> extends AdjacencyMatrix<T> {
  @override
  void addDirectedEdge(
      {Vertex<T> source, Vertex<T> destination, double weight}) {
    super.addDirectedEdge(
        source: source, destination: destination, weight: weight ?? 1);
  }
}
