import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/bitmap.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart';
import 'package:safetrack/src/domain/repository/GeolocatorRepository.dart';

class GeolocatorRepositoryImpl implements GeolocatorRepository {
  @override
  Future<Position> findPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<BitmapDescriptor> createMarkerFromAsset(String path) async {
    ImageConfiguration configuration = ImageConfiguration();
    BitmapDescriptor descriptor =
        await BitmapDescriptor.fromAssetImage(configuration, path);
    return descriptor;
  }

  @override
  Marker getMarker(String markerId, double lat, double log, String title,
      String content, BitmapDescriptor imageMarker) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
        markerId: id,
        icon: imageMarker,
        position: LatLng(lat, log),
        infoWindow: InfoWindow(title: title, snippet: content));
    return marker;
  }
}
