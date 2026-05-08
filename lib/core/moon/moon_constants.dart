class MoonConstants {
  MoonConstants._();

  static const double synodicMonth = 29.530588861;
  static const Duration activeWindow = Duration(hours: 24);
  static const Duration gracePeriod = Duration(hours: 48);
  static const Duration totalRitualWindow = Duration(hours: 72);
  static const Duration halfActiveWindow = Duration(hours: 12);
  static const double j2000Epoch = 2451545.0;
  static const double referenceNewMoonJD = 2451550.09766;
}
