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

class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  int my_field;
  PilotedCraft(String name, DateTime launchDate, this.my_field)
    : super(name, launchDate);
}

void main() {
  print('Pass here ...');
}