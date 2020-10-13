class Animal {
  String name;
  String type;

  Animal(String name, String type) {
    this.name = name;
    this.type = type;
  }
}

void main() {
  Animal a = new Animal('Nora', 'cat');
  print(a);
}