import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sbucks/src/utils/size_config.dart';
// import 'package:sbucks/src/widgets/common/app_text_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sbucks/src/models/store_model.dart';

class StoreDetail extends StatefulWidget {
  final OutletModel outletData;
  StoreDetail(this.outletData);
  @override
  State<StoreDetail> createState() => StoreDetailState();
}

class StoreDetailState extends State<StoreDetail> {
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

  @override
  Widget build(BuildContext context) {
    final _markers = Set<Marker>()
      ..add(Marker(
        markerId: MarkerId(widget.outletData.branchCode),
        position:
            LatLng(widget.outletData.longitude, widget.outletData.latitude),
        infoWindow: InfoWindow(
            title: widget.outletData.branchName,
            snippet: widget.outletData.distanceText,
            onTap: () {}),
        icon: BitmapDescriptor.defaultMarker,
      ));

    return new Scaffold(
      appBar: AppBar(title: Text(widget.outletData.branchName)),
      body: Column(
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
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    widget.outletData.latitude, widget.outletData.longitude),
                zoom: 14.4746,
              ),
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
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.sch, horizontal: 15.scw),
                  child: Text(
                    widget.outletData.branchName,
                    style:
                        TextStyle(color: Colors.green[900], fontSize: 20.scs),
                  ),
                ),
                ExpansionTile(
                  title: Text('Ameneties'),
                  children: [
                    Row(
                      children: [Icon(Icons.fire_extinguisher), Text('test')],
                    ),
                    Row(
                      children: [Icon(Icons.fire_extinguisher), Text('test')],
                    ),
                    Row(
                      children: [Icon(Icons.fire_extinguisher), Text('test')],
                    ),
                    Row(
                      children: [Icon(Icons.fire_extinguisher), Text('test')],
                    ),
                  ],
                ),
                InkWell(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Get Direction'),
                        Text(widget.outletData.branchName),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Call Now'),
                        Text(widget.outletData.branchName),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Open Hours'),
                        Text(
                            '${widget.outletData.branchCode} - ${widget.outletData.branchCode} : ${widget.outletData.branchCode} - ${widget.outletData.branchCode}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // _buildListStore(
  //   String name,
  //   String address,
  //   String openDay,
  //   String openHour,
  //   String closeDay,
  //   String closeHour,
  // ) =>
  //     Container(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 15.scw),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(name, style: TextStyle(color: Colors.green[900])),
  //                 Text(
  //                   address,
  //                   textAlign: TextAlign.justify,
  //                 ),
  //                 Text('Operational Hour:'),
  //                 Text('$openDay - $closeDay: $openHour : $closeHour'),
  //               ],
  //             ),
  //           ),
  //           Divider(
  //             thickness: 2.scs,
  //             color: Colors.black,
  //           )
  //         ],
  //       ),
  //     );
}
