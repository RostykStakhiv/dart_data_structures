part of 'graphs.dart';

enum EdgeType {
  directed,
  undirected,
}

abstract class Graph<T> {
  Vertex<T> createVertex(T value);
  void addDirectedEdge({
    @required Vertex<T> source,
    @required Vertex<T> destination,
    double weight,
  });

  void addUndirectedEdge({
    @required Vertex<T> source,
    @required Vertex<T> destination,
    double weight,
  });

  void addEdge({
    @required EdgeType edgeType,
    @required Vertex<T> source,
    @required Vertex<T> destination,
    double weight,
  });

  List<Edge<T>> edgesFrom({@required Vertex<T> source});
  List<Vertex<T>> get vertices;
  double weightFromSourceToDestination(Vertex<T> source, Vertex<T> destination);
}

mixin GraphEdgeAdder<T> on Graph<T> {
  @override
  void addEdge(
      {EdgeType edgeType, Vertex source, Vertex destination, double weight}) {
    switch (edgeType) {
      case EdgeType.directed:
        addDirectedEdge(
          source: source,
          destination: destination,
          weight: weight,
        );
        break;
      case EdgeType.undirected:
        addUndirectedEdge(
          source: source,
          destination: destination,
          weight: weight,
        );
        break;
    }
  }

  @override
  void addUndirectedEdge({Vertex source, Vertex destination, double weight}) {
    addDirectedEdge(source: source, destination: destination, weight: weight);
    addDirectedEdge(source: destination, destination: source, weight: weight);
  }
}
