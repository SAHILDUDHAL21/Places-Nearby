// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import '../models/place_model.dart';

// class PlaceMapView extends StatefulWidget {
//   final PlaceModel place;

//   const PlaceMapView({super.key, required this.place});

//   @override
//   State<PlaceMapView> createState() => _PlaceMapViewState();
// }

// class _PlaceMapViewState extends State<PlaceMapView> {
//   @override
//   void initState() {
//     super.initState();
//     // Required for Android WebView
//     WebViewPlatform.instance = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final lat = widget.place.lat;
//     final lon = widget.place.lng;

//     final mapUrl =
//         'https://www.openstreetmap.org/?mlat=$lat&mlon=$lon#map=17/$lat/$lon';

//     return Scaffold(
//       appBar: AppBar(title: Text(widget.place.name)),
//       body: WebView(
//         initialUrl: mapUrl,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }

//sliping this till i get my api key 
//github la takun linkedin la takun du vatay