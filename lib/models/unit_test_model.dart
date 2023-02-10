

class UnitTest {

  String reverseName(String name){
    return name.split('').reversed.join('');
  }

  num getSum (a, b) => a + b;

}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});


  String sayNameAndAge(String name, int age){
    return 'My name is $name and i am $age years old';
  }

}