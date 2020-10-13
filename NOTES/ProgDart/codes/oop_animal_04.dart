class Animal {
  String name;
  int legCount;
}

class Cat extends Animal {
  String makeNoise() {
    print('Purrrrr');
  }
}

class Pig extends Animal {
  String makeNoise() {
    print('Oink');
  }
}

void main() {
  Cat cat = Cat();
  cat.name = 'Nora';
  cat.legCount = 4;
  print(cat);
  cat.makeNoise();

  Pig pig = Pig();
  pig.name = 'Babai';
  pig.legCount = 4;
  print(pig);
  pig.makeNoise();
}
