import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class GooglePlacesAutoComplete extends StatelessWidget {

   TextEditingController controller;
   String hinText;
   Function(Prediction prediction) onPlaceSelected;

   GooglePlacesAutoComplete(this.controller,this.hinText,this.onPlaceSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        boxDecoration: BoxDecoration(
          color: Colors.white
        ),
        googleAPIKey: "AIzaSyBhRMPEoOGKmVuLLyOvJ63shacL7J9MlMw",
        inputDecoration: InputDecoration(
          hintText: hinText,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: ["pe"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: onPlaceSelected,
        /* {
          print("placeDetails LAT " + prediction.lat.toString());
          print("placeDetails LNG " + prediction.lng.toString());
        },*/

        itemClick: (Prediction prediction) {
          controller.text = prediction.description ?? "";
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
        },
        seperatedBuilder: Divider(),
        containerHorizontalPadding: 10,

        // OPTIONAL// If you want to customize list view item builder
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 7,
                ),
                Expanded(child: Text("${prediction.description ?? ""}"))
              ],
            ),
          );
        },

        isCrossBtnShown: true,

        // default 600 ms ,
      ),
    );
  }
}
