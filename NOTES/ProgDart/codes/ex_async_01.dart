// From: http://jpryan.me/dartbyexample/examples/async_await/

import 'dart:async';

const Duration delay = const Duration(milliseconds: 5000);

// This function does not use async/await, just the standard Future API
Future loadLastName(String prefix) {
  return Future.delayed(delay).then( (_) {
    return prefix + 'son';
  });
}

// Marking a function with 'async' will return a future
// that completes with the returned value.
// This function is equivalent to [loadLastName]
Future loadLastName2(String prefix) async {
  await new Future.delayed(delay);
  return prefix + 'son';
}


void main() async {
  var thorsLastName = await loadLastName('Odin');
  print('Pass here 1');
  
  var lokisLastName = await loadLastName('Laufey');
  print('Pass here 2');

  print('Thor $thorsLastName');
  print('Loki $lokisLastName');
}