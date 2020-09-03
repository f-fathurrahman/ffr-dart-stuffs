import 'dart:html';

void main() {
  querySelector('#output').text = 'Your Dart app is running.';
  querySelector('#button').onClick.listen(sayHello);
}

void sayHello(MouseEvent event) {
  querySelector('#name').text = (querySelector('#name_box') as InputElement).value;
  (querySelector('#name_box') as InputElement).value = '';
}