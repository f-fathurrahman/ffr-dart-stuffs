class Animal {
  String name;
  String type;
  int age;

  // Constructor, automatically assigns arguments
  // to properties with the same name
  Animal(this.name, this.type, this.age) {
    print('An instance of Animal is created.');
  }
}

void main() {
  Animal a = new Animal('Nora', 'cat', 2);
  print('a = $a');
  print('a.name = ${a.name}');
  print('a.type = ${a.type}');
  print('a.age  = ${a.age}');
}