import 'package:safetrack/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:safetrack/src/domain/useCases/geolocator/FIndPositionUseCase.dart';
import 'package:safetrack/src/domain/useCases/geolocator/GetMarkerUseCase.dart';

class GeolocatorUseCases {
  FindPositionUseCase findPosition;
  CreateMarkerUseCase markerUseCase;
  GetMarkerUseCase getMarker;


  GeolocatorUseCases({
    required this.findPosition,
    required this.markerUseCase,
    required this.getMarker});
  
}
