import 'package:dart_data_structures/graphs/graphs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class GraphTester {
  GraphTester({@required this.graphConstructorCallback});

  Graph _graph;
  final Graph Function() graphConstructorCallback;

  void testCreateVertexOnEmptyGraph() {
    _graph.createVertex(1);
    expect(_graph.vertices.length, 1);
  }

  void runTests() {
    setUp(() {
      _graph = graphConstructorCallback();
    });

    test('''GIVEN an empty graph
          WHEN the createVertex() method is called
          THEN vetices count is equal to 1''', () {
      _graph.createVertex(1);
      expect(_graph.vertices.length, 1);
    });

    test('''GIVEN an empty graph
          WHEN the createVertex() method is called
          THEN vetices count is equal to 1''', () {
      _graph.createVertex(1);
      expect(_graph.vertices.length, 1);
    });

    group('Adding new edge tests', () {
      Vertex<int> sourceVertex;
      Vertex<int> destinationVertex;

      setUp(() {
        sourceVertex = _graph.createVertex(1);
        destinationVertex = _graph.createVertex(2);
      });

      test('''GIVEN graph with no edges
            WHEN a method to create a DIRECTED edge is called
            THEN only 1 DIRECTED edge is created from SOURCE to DESTINATION''',
          () {
        _graph.addDirectedEdge(
            source: sourceVertex, destination: destinationVertex);
        final edgesFromSource = _graph.edgesFrom(source: sourceVertex);

        expect(edgesFromSource.length, 1,
            reason: 'Directed edge from source has not been created');
        expect(edgesFromSource.first.destination, destinationVertex,
            reason: 'Directed edge has been created with wrong destination');

        final edgesFromDestination = _graph.edgesFrom(source: destinationVertex);
        expect(edgesFromDestination.length, 0,
            reason:
                'Directed edge has been created from destination to source by mistake. Possibly undirected edge has been created instead of a directed one.');
      });

      test('''GIVEN graph with no edges
            WHEN a method to create an UNDIRECTED edge is called
            THEN 1 DIRECTED edge gets created from SOURCE to DESTINATION and 1 directed edge gets created from DESTINATION to SOURCE''',
          () {
        _graph.addUndirectedEdge(
            source: sourceVertex, destination: destinationVertex);
        final edgesFromSource = _graph.edgesFrom(source: sourceVertex);

        expect(edgesFromSource.length, 1,
            reason: 'Directed edge from SOURCE has not been created');
        expect(edgesFromSource.first.destination, destinationVertex,
            reason: 'Directed edge has been created with wrong DESTINATION');

        final edgesFromDestination = _graph.edgesFrom(source: destinationVertex);
        expect(edgesFromDestination.length, 1,
            reason: 'Directed edge from DESTINATION has not been created');
        expect(edgesFromDestination.first.destination, sourceVertex,
            reason:
                'Directed edge from DESTINATION to SOURCE should have its DESTINATION value set to sourceVertex');
      });

      group('Add edge functionality tests', () {
        test('''GIVEN graph with no edges
            WHEN a method to add edge is called with edge type parameter equal to DIRECTED
            THEN only 1 DIRECTED edge is created from SOURCE to DESTINATION''',
            () {
          _graph.addEdge(
            edgeType: EdgeType.directed,
            source: sourceVertex,
            destination: destinationVertex,
          );
        });
      });
    });
  }
}
