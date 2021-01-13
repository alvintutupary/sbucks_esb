import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:geolocator/geolocator.dart';

class TestAja extends StatefulWidget {
  @override
  State<TestAja> createState() => TestAjaState();
}

class TestAjaState extends State<TestAja> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  String _search;
  // Completer<GoogleMapController> _controllerGoogleMap = Completer();

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

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.258706, 106.620660),
    zoom: 14.4746,
  );

  final _markers = Set<Marker>()
    ..add(Marker(
      markerId: MarkerId('Starbucks Bez Plaza Gading Serpong'),
      position: LatLng(-6.258734, 106.620563),
      infoWindow: InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ))
    ..add(Marker(
      markerId: MarkerId('Starbucks 2 - Supermall Karawaci'),
      position: LatLng(-6.226583, 106.607870),
      infoWindow: InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ))
    ..add(Marker(
      markerId: MarkerId('Starbucks Coffee Sumarecon Mall Serpong 2'),
      position: LatLng(-6.241862, 106.627498),
      infoWindow: InfoWindow(
        title: 'Really cool place',
        snippet: '5 Star Rating',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

  static final CameraPosition _kLake = CameraPosition(
      bearing: 0, //192.8334901395799,
      target: LatLng(-6.258706, 106.620660),
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final searchField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please distric password" : null,
      onSaved: (value) => _search = value,
      decoration: buildInputDecoration(hintText: "distric", icon: Icons.search),
    );
    return new Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200.sch,
                      child: GoogleMap(
                        padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
                        mapType: MapType.normal,
                        myLocationButtonEnabled: true,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: true,
                        initialCameraPosition: _kGooglePlex,
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
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sch, horizontal: 15.scw),
                      child: Text(
                        'Nearby Store',
                        style: TextStyle(
                            color: Colors.green[900], fontSize: 20.scs),
                      ),
                    ),
                    Container(
                      height: 340.sch,
                      child: ListView(
                        children: [
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                          _buildListStore(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: searchField,
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              // Align(
              //   child: Container(
              //     color: Colors.yellow,
              //     child: Text(
              //       'Somthing to show',
              //       style: TextStyle(fontSize: 25),
              //     ),
              //   ),
              //   alignment: Alignment.topLeft,
              // ),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  _buildListStore() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.scw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Summarecon Mall Serpong 2',
                      style: TextStyle(color: Colors.green[900])),
                  Text(
                    '''Jl. Gading Serpong Boulevard No.Sumarecon Mall Serpong, Jl. Gading Serpong Boulevard No.245, Pakulonan Bar., Kec. Klp. Dua, Tangerang, Banten 15810''',
                    textAlign: TextAlign.justify,
                  ),
                  Text('Operational Hour:'),
                  Text('Mon - Sun: 07.00:20.00'),
                ],
              ),
            ),
            Divider(
              thickness: 2.scs,
              color: Colors.black,
            )
          ],
        ),
      );

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controllerGoogleMap.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
