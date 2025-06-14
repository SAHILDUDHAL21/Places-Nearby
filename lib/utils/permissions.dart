import 'package:geolocator/geolocator.dart';

Future<bool> requestLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  return permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse;
}

//nako du permission me swatha karin 😅