class Animal {
  String name;
  String type;

  Animal(this.name, this.type);

  String toString() {
    return 'This is an animal with name $name and type $type';
  }
}

void main() {
  Animal a = new Animal('Nora', 'cat');
  print(a);
}