import 'package:dog_facts/dog/model.dart';
import 'package:test/test.dart';

void main() {
  test('fromJson returns a Dog object', () {
    final dog = DogFact.fromJson({
      "facts": ["test fact"]
    });
    expect(dog.fact, ["test fact"]);
  });
}