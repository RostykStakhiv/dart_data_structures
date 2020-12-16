import 'package:dart_data_structures/trees/trie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Trie<List<int>> trie = Trie();

  setUp(() {
    trie.insert([1,2,3,4,5]);
  });

  group('Insert tests', () {
    test('Insert into empy tree', () {
      Trie<List<int>> trie = Trie();
      trie.insert([1,2,3]);
      expect(trie.contains([1,2,3]), true);
    });

    test('Insert into non-empy tree', () {

    });
  });

  group('Contains tests', () {
    test('Contains in empy tree', () {

    });

    test('Contains existing value', () {
    });
  });

  group('Remove tests', () {
    test('Removes existing value', () {
      final trie = Trie();
      trie.insert([1,2,3,4,5]);

      expect(trie.isNotEmpty, true);
      
      trie.remove([1,2,3,4,5]);
      expect(trie.isEmpty, true);
    });
  });
}