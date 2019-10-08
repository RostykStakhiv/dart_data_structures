import 'package:dart_data_structures/exceptions/trees/tree_node_exceptions.dart';
import 'package:dart_data_structures/trees/nodes/tree_node.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  TreeNode<String> vehicleNode;

  TreeNode<String> fourWheelVehicleNode;
  TreeNode<String> twoWheelVehicleNode;
  TreeNode<String> oneWheelVehicleNode;

  TreeNode<String> carNode;
  TreeNode<String> bikeNode;
  TreeNode<String> monoCycleNode;

  TreeNode<String> kiaNode;
  TreeNode<String> seatNode;
  TreeNode<String> bmwNode;

  TreeNode<String> suzukiNode;
  TreeNode<String> kawasakiNode;

  setUp(() {
    vehicleNode = TreeNode<String>(value: 'Vehicle');

    fourWheelVehicleNode = TreeNode<String>(value: '4WheelVehicle');
    twoWheelVehicleNode = TreeNode<String>(value: '2WheelVehicle');
    oneWheelVehicleNode = TreeNode<String>(value: 'MonoWheelVehicle');

    carNode = TreeNode<String>(value: 'Car');
    bikeNode = TreeNode<String>(value: 'Bike');
    monoCycleNode = TreeNode<String>(value: 'MonoCycle');

    kiaNode = TreeNode<String>(value: 'Kia');
    seatNode = TreeNode<String>(value: 'Seat');
    bmwNode = TreeNode<String>(value: 'BMW');

    suzukiNode = TreeNode<String>(value: 'Suzuki');
    kawasakiNode = TreeNode<String>(value: 'Kawasaki');

    vehicleNode.add(fourWheelVehicleNode);
    vehicleNode.add(twoWheelVehicleNode);
    vehicleNode.add(oneWheelVehicleNode);

    fourWheelVehicleNode.add(carNode);
    twoWheelVehicleNode.add(bikeNode);
    oneWheelVehicleNode.add(monoCycleNode);

    carNode.add(kiaNode);
    carNode.add(seatNode);
    carNode.add(bmwNode);

    bikeNode.add(suzukiNode);
    bikeNode.add(kawasakiNode);
  });

  test('Finds existing node', () {
    const int testValuesCount = 20;

    var uuid = Uuid();

    var testVals = List<String>();
    var testNodes = List<TreeNode<String>>();

    for (int i = 0; i < testValuesCount; ++i) {
      final generatedString = uuid.v1();

      testVals.add(generatedString);
      testNodes.add(TreeNode<String>(value: generatedString));

      vehicleNode.children.add(testNodes[i]);

      expect(vehicleNode.search(value: generatedString), testNodes[i]);
    }
  });

  test('Adds a new node to the tree', () {
    final newNode = TreeNode<String>(value: 'NewNode');
    vehicleNode.add(newNode);
    expect(vehicleNode.search(value: newNode.value), newNode);
  });

  test('Throws exception if trying to add null', () {
    expect(() => vehicleNode.add(null),
        throwsA(isInstanceOf<TryingToAddNullException>()));
  });

  group('Depth-first functionality tests', () {
    test('Depth-first traversal when having only left children', () {
      const int depth = 5;

      TreeNode<int> root;
      TreeNode<int> prevNode;

      for (int i = 0; i < depth; ++i) {
        final newNode = TreeNode<int>(value: i);

        prevNode?.add(newNode);

        prevNode = newNode;
        if (root == null) {
          root = newNode;
        }
      }

      int index = 0;
      bool orderCorrect = true;
      root.depthFirstTraversal((node) {
        if (node.value != index) {
          orderCorrect = false;
        }

        index++;
      });

      expect(orderCorrect, true);
    });

    test('Depth-first traversal when having multiple children', () {
      final List<TreeNode<String>> depthFirstNodes = [
        vehicleNode,
        fourWheelVehicleNode,
        carNode,
        kiaNode,
        seatNode,
        bmwNode,
        twoWheelVehicleNode,
        bikeNode,
        suzukiNode,
        kawasakiNode,
        oneWheelVehicleNode,
        monoCycleNode
      ];

      var traversedNodes = List<TreeNode>();
      vehicleNode.depthFirstTraversal((node) {
        traversedNodes.add(node);
      });

      expect(traversedNodes, depthFirstNodes);
    });
  });

  group('Level-order traversal testing', () {
    test('Level-order traversal when having multiple children', () {
      final List<TreeNode> levelOrderNodes = [
        vehicleNode,
        fourWheelVehicleNode,
        twoWheelVehicleNode,
        oneWheelVehicleNode,
        carNode,
        bikeNode,
        monoCycleNode,
        kiaNode,
        seatNode,
        bmwNode,
        suzukiNode,
        kawasakiNode
      ];

      var traversedNodes = List<TreeNode>();
      vehicleNode.levelOrderTraversal((node) {
        traversedNodes.add(node);
      });

      expect(traversedNodes, levelOrderNodes);
    });
  });
}
