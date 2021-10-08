import 'package:dart_data_structures/helpers/circular_buffer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Circular Buffer Write tests', () {
    test('Calling write() method adds new value to the buffer', () {
      final buffer = CircularBuffer<int>(size: 2);
      const valueToWrite = 1;
      buffer.write(valueToWrite);

      var bufferElements = <int>[];
      buffer.iterate((element) => bufferElements.add(element));

      expect(bufferElements, [valueToWrite]);
    });

    test('If buffer is full write() operation fails', () {
      final buffer = CircularBuffer<int>(size: 2);

      const el1 = 1;
      const el2 = 2;
      buffer.write(el1);
      buffer.write(el2);

      final writeRes = buffer.write(3);
      var bufferElements = <int>[];
      buffer.iterate((element) => bufferElements.add(element));
        
      expect(writeRes, isFalse);
      expect(bufferElements, [el1, el2]);
    });
  });

  group('CircularBuffer Read tests', () {
    test('Elements are read in the same order they have been written', () {
      const bufferSize = 3;
      final buffer = CircularBuffer<int>(size: bufferSize);
      var elementsToWrite = <int>[];

      for(int i = 0; i < bufferSize; ++i) {
        elementsToWrite.add(i);
        buffer.write(i);
      }

      var readElements = <int>[];
      while(buffer.isNotEmpty()) {
        readElements.add(buffer.read());
      }

      expect(readElements, elementsToWrite);
    });
  });
}
