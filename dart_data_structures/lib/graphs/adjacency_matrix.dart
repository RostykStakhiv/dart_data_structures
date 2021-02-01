part of 'graphs.dart';

class AdjacencyMatrix<T> with Graph<T> {
  final _adjecencyMatrix = List<List<Edge<T>>>();
  final _vertices = List<Vertex<T>>();

  @override
  Vertex<T> createVertex(T value) {
    _vertices.add(Vertex<T>(index: _adjecencyMatrix.length, value: value));

    for (final edges in _adjecencyMatrix) {
      edges.add(null);
    }

    final weightsForNewVertix = List<Edge<T>>.filled(_vertices.length, null, growable: true);
    _adjecencyMatrix.add(weightsForNewVertix);

    return _vertices.last;
  }

  @override
  void addDirectedEdge(
      {Vertex<T> source, Vertex<T> destination, double weight}) {
    _adjecencyMatrix[source.index][destination.index] =
        Edge<T>(source: source, destination: destination, weight: weight);
  }

  @override
  List<Edge<T>> edgesFrom({Vertex<T> source}) {
    return _adjecencyMatrix[source.index]
        .where((edge) => edge != null)
        .toList();
  }

  @override
  double weightFromSourceToDestination(
      Vertex<T> source, Vertex<T> destination) {
    return _adjecencyMatrix[source.index][destination.index]?.weight;
  }

  @override
  List<Vertex<T>> get vertices => List.unmodifiable(_vertices);
}
