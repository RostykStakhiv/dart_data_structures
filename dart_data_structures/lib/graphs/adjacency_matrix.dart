part of 'graphs.dart';

class AdjacencyMatrix<T> with Graph<T> {
  final _weights = List<List<double>>();
  final _vertices = List<Vertex<T>>();

  static const double _defaultWeight = 0;

  @override
  Vertex<T> createVertex(T value) {
    _vertices.add(Vertex<T>(index: _weights.length, value: value));

    for (final edges in _weights) {
      edges.add(null);
    }

    final weightsForNewVertix =
        List<double>.filled(_vertices.length, null, growable: true);
    _weights.add(weightsForNewVertix);

    return _vertices.last;
  }

  @override
  void addDirectedEdge(
      {Vertex<T> source, Vertex<T> destination, double weight}) {
    _weights[source.index][destination.index] = weight;
  }

  @override
  List<Edge<T>> edgesFrom({Vertex<T> source}) {
    final edges = List<Edge<T>>();
    for (var column = 0; column < _vertices.length; ++column) {
      final weight = _weights[source.index][column];

      if (weight != null) {
        edges.add(Edge<T>(
            source: source, destination: _vertices[column], weight: weight));
      }
    }

    return edges;
  }

  @override
  double weightFromSourceToDestination(
      Vertex<T> source, Vertex<T> destination) {
    return _weights[source.index][destination.index];
  }

  @override
  List<Vertex<T>> get vertices => List.unmodifiable(_vertices);
}
