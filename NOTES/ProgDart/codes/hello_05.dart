import 'dart:io';

void main() {
  stdout.writeln('Say hello to my bro');
  String input = stdin.readLineSync();
  sayHello(input);
}

void sayHello(String name) {
  print('Hello $name, my bro. Nice to meet you');
}
