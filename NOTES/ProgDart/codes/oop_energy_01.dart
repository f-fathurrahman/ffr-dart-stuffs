// Factory and named constructors are special contructors. They create
// an instance of that class, but with predetermined properties.
// Named constructors always return a new instance of a class. factory methods have a
// bit more flexibility: they can return cached instances or instances that are subtypes.

class Energy {
  int joules;

  // Default constructor
  Energy(this.joules);

  // Named constructor
  Energy.fromWind(int windBlows) {
    final joules = _convertWindToEnergy(windBlows);
    return Energy(joules);
  }

  factory Energy.fromSolar(int sunbeams) {
    if(app.stateEnergy != null) return appState.solarEnergy;
    final joules = _convertSunbeamsToJoules(sunbeams);
    return appState.solarEnergy = Energy(joules);
  }

}