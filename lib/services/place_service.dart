import 'package:geolocator/geolocator.dart';
import '../models/place_model.dart';

class PlaceService {
  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      return null;
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static Future<Position?> getLatLngFromCity(String city) async {
    // Dummy lat/lng for now;
    return Position(
      latitude: 18.5204,
      longitude: 73.8567,
      timestamp: DateTime.now(),
      accuracy: 5.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 1.0,
      headingAccuracy: 1.0,
      floor: null,
      isMocked: false,
    );
  }

  static Future<List<PlaceModel>> getNearbyPlaces(
      double lat, double lng) async {
    // dummy static nearby data; api alya var change karu
    return [
      PlaceModel(
        name: 'Hotel Paradise',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.01,
        lng: lng + 0.01,
        distance: 1.2,
      ),
      PlaceModel(
        name: 'City Garden',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.02,
        lng: lng + 0.015,
        distance: 2.0,
      ),
      PlaceModel(
        name: 'Hotel Regency',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.02,
        lng: lng + 0.015,
        distance: 2.0,
      ),
      PlaceModel(
        name: 'City Park',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.02,
        lng: lng + 0.015,
        distance: 2.0,
      ),
      PlaceModel(
        name: 'New City Mall',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.02,
        lng: lng + 0.015,
        distance: 2.0,
      ),
      PlaceModel(
        name: 'Childrens Day Park',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.02,
        lng: lng + 0.015,
        distance: 2.0,
      ),
      PlaceModel(
        name: 'Roast and Toast Cafe',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.02,
        lng: lng + 0.015,
        distance: 2.0,
      ),
      PlaceModel(
        name: 'City Hospital',
        photoUrl: 'https://via.placeholder.com/150',
        lat: lat + 0.02,
        lng: lng + 0.015,
        distance: 2.0,
      ),
    ];
  }
}
