abstract class TreeNodeException implements Exception {
  String cause;
  TreeNodeException(this.cause);
}

class TryingToAddNullException extends TreeNodeException {
  TryingToAddNullException()
      : super('Invalid operation: Trying to add null to Tree Node children');
}
