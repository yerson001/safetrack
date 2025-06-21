import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safetrack/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:safetrack/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:safetrack/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerState.dart';

class ClientMapSeekerBloc
    extends Bloc<ClientMapSeekerEvent, ClientMapSeekerState> {
  GeolocatorUseCases geolocatorUseCases;

  ClientMapSeekerBloc(this.geolocatorUseCases) : super(ClientMapSeekerState()) {
    on<ClientMapSeekerInitEvent>((event, emit) {
      Completer<GoogleMapController> controller =
          Completer<GoogleMapController>();
      emit(state.copyWith(controller: controller));
    });

    on<FindPosition>((event, emit) async {
      Position position = await geolocatorUseCases.findPosition.run();

      add(ChangeMapCameraPosition(
          lat: position.latitude, log: position.longitude));

/*
      BitmapDescriptor imageMarker = await geolocatorUseCases.markerUseCase
          .run('assets/img/location_blue.png');

      Marker marker = geolocatorUseCases.getMarker.run(
          'MyPosition',
          position.latitude,
          position.longitude,
          'Mi posicion',
          '',
          imageMarker);
          */

      emit(state.copyWith(
        position: position,
        //markers: {marker.markerId: marker},
      ));

      print('Position Lat: ${position.latitude}');
      print('Position Log: ${position.longitude}');
    });

    on<ChangeMapCameraPosition>((event, emit) async {
      GoogleMapController googleMapController = await state.controller!.future;
      await googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.lat, event.log), zoom: 13, bearing: 0)));
    });
  }


}
