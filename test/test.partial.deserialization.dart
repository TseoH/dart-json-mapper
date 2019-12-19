part of json_mapper.test;

testPartialDeserialization() {
  group("[Verify partial processing]", () {
    test("Person deserialization", () {
      // given
      final String partialPersonJson = '''{
 "name": "Bob",
 "lastName": "Marley"
}''';
      // when
      final Person target = JsonMapper.deserialize(partialPersonJson);
      // then
      expect(target.name, "Bob"); // set from JSON
      expect(target.lastName, "Marley"); // set from JSON
      expect(target.fullName, "Bob Marley"); // set from JSON
      expect(target.skills, ['Go', 'Dart', 'Flutter']); // default value
      expect(target.sym, Symbol('foo')); // default value
    });

    test("Getters only serialization", () {
      // given
      final instance = GettersOnly();
      // when
      final json = JsonMapper.serialize(instance, '');
      // then
      expect(json, '''{"nextCatId":"c0","nextDogId":"h1"}''');
    });
  });
}
