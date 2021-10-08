import 'package:dart_data_structures/graphs/graphs.dart';

import 'graph_tester.dart';

GraphTester graphTester;
void main() {
  graphTester = GraphTester(
    graphConstructorCallback: () => AdjacencyMatrix<int>(),
  );
  graphTester.runTests();
}
