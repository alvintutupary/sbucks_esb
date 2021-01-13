import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sbucks/src/models/store_model.dart';
import 'package:sbucks/src/screens/store_screen/store_screen_widgets/store_detail.dart';

final datas = List<StoreModel>()
  ..add(StoreModel(
      1,
      'Starbucks Bez Plaza Gading Serpong',
      '''Jl. Gading Serpong Boulevard No.Sumarecon Mall Serpong, Jl. Gading Serpong Boulevard No.245, Pakulonan Bar., Kec. Klp. Dua, Tangerang, Banten 15810''',
      'Monday',
      '10:00',
      'Sunday',
      '22:00',
      -6.258734,
      106.620563))
  ..add(StoreModel(
      2,
      'Starbucks 2 - Supermall Karawaci',
      '''Jl. Gading Serpong Boulevard No.Sumarecon Mall Serpong, Jl. Gading Serpong Boulevard No.245, Pakulonan Bar., Kec. Klp. Dua, Tangerang, Banten 15810''',
      'Monday',
      '08:00',
      'Friday',
      '22:00',
      -6.226583,
      106.607870))
  ..add(StoreModel(
      2, 'Starbucks 2 - Supermall Karawaci', '''Jl. Gading Serpong Boulevard No.Sumarecon Mall Serpong, Jl. Gading Serpong Boulevard No.245, Pakulonan Bar., Kec. Klp. Dua, Tangerang, Banten 15810''', 'Monday', '08:00', 'Friday', '22:00', 37.4095, -122.0994))
  ..add(StoreModel(
      3,
      'Starbucks Coffee Sumarecon Mall Serpong 2',
      '''Jl. Gading Serpong Boulevard No.Sumarecon Mall Serpong, Jl. Gading Serpong Boulevard No.245, Pakulonan Bar., Kec. Klp. Dua, Tangerang, Banten 15810''',
      'Monday',
      '10:00',
      'Saturday',
      '20:00',
      -6.226583,
      106.607870));

class StoreScreen extends StatefulWidget {
  @override
  State<StoreScreen> createState() => StoreScreenState();
}

class StoreScreenState extends State<StoreScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  String _search;

  GoogleMapController newGoogleMapController;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Position currentPosition;
  var geoLocator = Geolocator();

  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLngPosition = LatLng(
        position.latitude ?? -6.258706, position.longitude ?? 106.620660);
    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _kinitLoc = CameraPosition(
    target: LatLng(-6.244176, 106.625622),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final _markers = datas
        .map((data) => Marker(
              markerId: MarkerId(data.name),
              position: LatLng(data.longitude, data.latitude),
              infoWindow: InfoWindow(
                  title: data.name,
                  snippet: data.name,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => StoreDetail(data)));
                  }),
              icon: BitmapDescriptor.defaultMarker,
            ))
        .toSet();

    final searchField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please distric password" : null,
      onSaved: (value) => _search = value,
      decoration: buildInputDecoration(hintText: "distric", icon: Icons.search),
    );
    return new Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: searchField,
              color: Colors.white,
            ),
          ),
          Container(
            height: 200.sch,
            child: GoogleMap(
              padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: _kinitLoc,
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
                locatePosition();
                setState(() {
                  bottomPaddingOfMap = 265.0;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sch, horizontal: 15.scw),
            child: Text(
              'Nearby Store',
              style: TextStyle(color: Colors.green[900], fontSize: 20.scs),
            ),
          ),
          Expanded(
            // height: 340.sch,
            child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) => _buildListStore(
                  datas[index].name,
                  datas[index].address,
                  datas[index].openDay,
                  datas[index].openHour,
                  datas[index].closeDay,
                  datas[index].closeHour, onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => StoreDetail(datas[index])));
              }),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  _buildListStore(String name, String address, String openDay, String openHour,
          String closeDay, String closeHour,
          {Function onTap}) =>
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.scw),
              child: InkWell(
                onTap: onTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(color: Colors.green[900])),
                    Text(
                      address,
                      textAlign: TextAlign.justify,
                    ),
                    Text('Operational Hour:'),
                    Text('$openDay - $closeDay: $openHour : $closeHour'),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2.scs,
              color: Colors.black,
            )
          ],
        ),
      );
}
