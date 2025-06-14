import 'package:flutter/material.dart';
import '../models/place_model.dart';
import '../services/place_service.dart';

class AppProvider with ChangeNotifier {
  List<PlaceModel> _places = [];

  List<PlaceModel> get places => _places;

  Future<void> loadPlacesFromCurrentLocation() async {
    final position = await PlaceService.getCurrentLocation();
    if (position != null) {
      _places = await PlaceService.getNearbyPlaces(
          position.latitude, position.longitude);
      notifyListeners();
    }
  }

//providerusekaraylanitshikavalagallaygadbadhote
  Future<void> loadPlacesFromCity(String city) async {
    final latLng = await PlaceService.getLatLngFromCity(city);
    if (latLng != null) {
      _places =
          await PlaceService.getNearbyPlaces(latLng.latitude, latLng.longitude);
      notifyListeners();
    }
  }
}
