const delay = Duration(milliseconds: 1000);

Future<void> printWithDelay(String message) async {
  await Future.delayed(delay);
  print(message);
}

void main() {
  printWithDelay("Hello");
  print("Some other messages");
  printWithDelay("My friend");
  print("Another message");
  printWithDelay("Nice to see you");
}