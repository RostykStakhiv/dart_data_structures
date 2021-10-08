part of 'graphs.dart';

class AdjacencyList<T> with Graph<T> {
  final _adjacencies = Map<Vertex<T>, List<Edge<T>>>();

  @override
  Vertex<T> createVertex(T value) {
    final newVertex = Vertex<T>(index: _adjacencies.length, value: value);
    _adjacencies[newVertex] = <Edge<T>>[];
    return newVertex;
  }

  @override
  void addDirectedEdge(
      {Vertex<T> source, Vertex<T> destination, double weight}) {
    final newEdge =
        Edge<T>(source: source, destination: destination, weight: weight);
    _adjacencies[source].add(newEdge);
  }

  @override
  List<Edge<T>> edgesFrom({Vertex<T> source}) => _adjacencies[source];

  @override
  List<Vertex<T>> get vertices => _adjacencies.keys.toList();

  @override
  double weightFromSourceToDestination(
          Vertex<T> source, Vertex<T> destination) =>
      edgesFrom(source: source)
          .firstWhere((edge) => edge.destination == destination)
          .weight;
}
