import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';
import '../widgets/place_card.dart';
import '../utils/permissions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _placeController = TextEditingController();

  void _searchCity() {
    final city = _placeController.text.trim();
    if (city.isNotEmpty) {
      Provider.of<AppProvider>(context, listen: false).loadPlacesFromCity(city);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a City or Place')),
      );
    }
  }

  void _useCurrentLocation() async {
    final granted = await requestLocationPermission();
    if (granted) {
      Provider.of<AppProvider>(context, listen: false)
          .loadPlacesFromCurrentLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final places = Provider.of<AppProvider>(context).places;
    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Places')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _placeController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Place or City',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: _searchCity, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: _useCurrentLocation,
                    icon: const Icon(Icons.my_location)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (_, index) => PlaceCard(place: places[index]),
            ),
          )
        ],
      ),
    );
  }
}
