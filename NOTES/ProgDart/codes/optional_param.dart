void myFunc({int a: 2, int b: 3, String name: 'efefer'}) {
  print('a = $a');
  print('b = $b');
  print('name = $name');
}

void main() {
  myFunc(a: 123);
}