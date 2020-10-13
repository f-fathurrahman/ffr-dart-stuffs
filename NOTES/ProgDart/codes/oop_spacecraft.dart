class Spacecraft {
  String name;
  DateTime launchDate;

  Spacecraft(this.name, this.launchDate) {
    print("Initialization is here");
  }

  // Named constructor, forward to the default one
  Spacecraft.unlaunched(String name): this(name, null);

  int get launchYear => launchDate?.year; // read-only non-final property

  // method
  void describe() {
    print("Spacecraft: $name");
    if(launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    }
    else {
      print('Unlaunched');
    }
  }
}

void main() {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
}

