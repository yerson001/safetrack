import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safetrack/src/domain/repository/GeolocatorRepository.dart';

class GetMarkerUseCase {
  GeolocatorRepository geolocatorRepository;

  GetMarkerUseCase(this.geolocatorRepository);

  run(String markerId, double lat, double log, String title,
      String content, BitmapDescriptor imageMarker) => geolocatorRepository
      .getMarker(markerId, lat, log, title, content, imageMarker);
}
