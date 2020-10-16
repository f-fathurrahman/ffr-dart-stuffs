void main() {
  var my_str = 'efefer, 100';
  var my_str_splt = my_str.split(',');
  
  for(var s in my_str_splt){
    print("s = ${s.trim()}");
  }

  double nilai = double.parse(my_str_splt[1]);
  print("nilai = $nilai");
}