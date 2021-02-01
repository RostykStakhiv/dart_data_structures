import 'package:dart_data_structures/graphs/graphs.dart';

import 'helpers/graph_tester.dart';

void main() {
  final graphTester = GraphTester(
    graphConstructorCallback: () => UnweightedAdjacencyMatrix<int>(),
  );

  graphTester.runTests();
}
