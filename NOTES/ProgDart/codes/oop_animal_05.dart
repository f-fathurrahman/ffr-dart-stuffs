class Animal {
  String name;
  int legCount;
}
  
class Cat extends Animal {
  String makeNoise() {
    print('Miaw');
  }
}
  
class Chicken extends Animal {
  String makeNoise() {
    print('Kukuruyuk');
  }
}
  
void main() {
  Cat cat = Cat();
  cat.name = 'Nora';
  cat.legCount = 4;
  print(cat);
  cat.makeNoise();
  
  Chicken chicken = Chicken();
  chicken.name = 'Kukuk';
  chicken.legCount = 2;
  print(chicken);
  chicken.makeNoise();
}