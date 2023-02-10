
import 'package:flutter_test/flutter_test.dart';
import 'package:lokota/models/unit_test_model.dart';

void main (){
  group('testing al methods in the unitTest class', () {
    test('sum of two numbers', () {

    var sumTotal =   UnitTest().getSum(2, 4);
       // var sumTotal = unitTest.getSum(2, 4);

      expect(sumTotal, 6);

    });

    test('reverse any string', () {

      UnitTest unitTest = UnitTest();

      var reverseString = unitTest.reverseName('hello');

      expect(reverseString, 'olleh');

    });

  });


  group('', () {
    test('return a user model', () {

      Person person = Person(name: 'zion', age: 20);
      expect( person, isA<Person>());

    });
    test('return a user model', () {

      Person person = Person(name: 'zion', age: 20);
      var sayName = person.sayNameAndAge('zion', 20);
      expect( sayName,'My name is zion and i am 20 years old');

    });
  });



}