import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ClientMapSeekerState extends Equatable {
  final Position? position;
  final Completer<GoogleMapController>? controller;
  Map<MarkerId,Marker> markers = <MarkerId,Marker>{};

  ClientMapSeekerState({
    this.position,
    this.controller,
    this.markers = const <MarkerId,Marker>{}
    });

  ClientMapSeekerState copyWith({
    Position? position,
    Completer<GoogleMapController>? controller,
    Map<MarkerId,Marker>? markers
    }) {
    return ClientMapSeekerState(
      position: position ?? this.position,
      controller: controller??this.controller,
      markers: markers??this.markers
    );
  }

  @override
  List<Object?> get props => [position,markers,controller];
}
