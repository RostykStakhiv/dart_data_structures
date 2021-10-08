import 'package:dart_data_structures/graphs/graphs.dart';

import 'helpers/graph_tester.dart';

Graph<int> graph;
GraphTester graphTester;

void main() {
  graphTester = GraphTester(graphConstructorCallback: () {
    return AdjacencyList<int>();
  });

  graphTester.runTests();
}
