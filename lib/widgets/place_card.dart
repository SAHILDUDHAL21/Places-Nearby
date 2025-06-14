import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/place_model.dart';
//import 'place_map_view.dart';

class PlaceCard extends StatelessWidget {
  final PlaceModel place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: place.photoUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(place.name),
        subtitle: Text('${place.distance.toStringAsFixed(2)} km away'),
        trailing: const Icon(Icons.directions),
        onTap: () {
       
        },
      ),
    );
  }
}
