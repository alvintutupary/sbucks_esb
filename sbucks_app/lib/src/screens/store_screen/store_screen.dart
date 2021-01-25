import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sbucks/src/models/store_model.dart';
import 'package:sbucks/src/screens/store_screen/store_screen_widgets/store_detail.dart';
import 'package:provider/provider.dart';
import 'package:sbucks/src/blocs/store_bloc.dart';

class StoreScreen extends StatefulWidget {
  @override
  State<StoreScreen> createState() => StoreScreenState();
}

class StoreScreenState extends State<StoreScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  String search;

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchField = TextFormField(
      autofocus: false,
      validator: (value) => value.isEmpty ? "Please distric password" : null,
      onSaved: (value) => search = value,
      decoration: buildInputDecoration(hintText: "distric", icon: Icons.search),
    );

    Future<Widget> buildContent() async {
      final _storeBloc = Provider.of<StoreBloc>(context, listen: false);
      final result = await _storeBloc.fetchStore();
      List<OutletModel> outlets = result.body.outlet;

      final _markers = outlets
          .map((outlet) => Marker(
                markerId: MarkerId(outlet.branchCode),
                position: LatLng(outlet.longitude, outlet.latitude),
                infoWindow: InfoWindow(
                    title: outlet.branchName,
                    snippet: outlet.distanceText,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => StoreDetail(outlet)));
                    }),
                icon: BitmapDescriptor.defaultMarker,
              ))
          .toSet();

      return Column(
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
              itemCount: outlets.length,
              itemBuilder: (context, index) => _buildListStore(
                  outlets[index].branchName,
                  outlets[index].branchName,
                  outlets[index].branchCode,
                  outlets[index].branchCode,
                  outlets[index].branchCode,
                  outlets[index].branchCode, onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => StoreDetail(outlets[index])));
              }),
            ),
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: buildContent(),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) return snapshot.data;
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
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
