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

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
    : super(name, launchDate);

  void describe() {
    super.describe();
    print('Orbiter: altitude = $altitude');
  }
}


void main() {
  var orbiter = Orbiter('My Orbiter', DateTime(2000, 1, 1), 3000.0);
  orbiter.describe();
}

