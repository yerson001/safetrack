import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:safetrack/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerBloc.dart';
import 'package:safetrack/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerEvent.dart';
import 'package:safetrack/src/presentation/pages/client/mapSeeker/bloc/ClientMapSeekerState.dart';
import 'package:safetrack/src/presentation/widgets/GooglePlacesAutoComplete.dart';

class ClientMapSeekerPage extends StatefulWidget {
  const ClientMapSeekerPage({super.key});

  @override
  State<ClientMapSeekerPage> createState() => _ClientMapSeekerPageState();
}

class _ClientMapSeekerPageState extends State<ClientMapSeekerPage> {
  TextEditingController pickUpController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ClientMapSeekerBloc>().add(ClientMapSeekerInitEvent());
      context.read<ClientMapSeekerBloc>().add(FindPosition());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ClientMapSeekerBloc, ClientMapSeekerState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
                ),
                markers: Set<Marker>.of(state.markers.values),
                onMapCreated: (GoogleMapController controller) {
                  controller.setMapStyle(
                      '[{"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#8ec3b9"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#1a3646"}]},{"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#64779e"}]},{"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},{"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"color":"#334e87"}]},{"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#6f9ba5"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#023e58"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#3C7680"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#255763"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#b0d5ce"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#023e58"}]},{"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},{"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},{"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#283d6a"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#3a4762"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}]');

                  if (!state.controller!.isCompleted) {
                    state.controller?.complete(controller);
                  }
                },
              ),
              Container(
                height: 140,
                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Card(
                  surfaceTintColor: Colors.white,
                  child: Column(
                    children: [
                      GooglePlacesAutoComplete(pickUpController, "Recoger en ",
                          (Prediction) {
                        print('Rec Lat: ${Prediction.lat}');
                        print('Rec Lat: ${Prediction.lng}');
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      GooglePlacesAutoComplete(
                          destinationController, "Dejar en ", (Prediction) {
                        print('Dej Lat: ${Prediction.lat}');
                        print('Dej Lat: ${Prediction.lng}');
                      }),
                    ],
                  ),
                ),
              ),
              _iconMyLocation()
            ],
          );
        },
      ),
    );
  }

    Widget _iconMyLocation(){
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/location_blue.png',
        width: 55,
        height: 55,
      ),
    );
  }
}
