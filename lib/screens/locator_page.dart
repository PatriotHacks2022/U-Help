import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:swipe_shop_flutter/data_classes/people_data.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';
import 'package:swipe_shop_flutter/screens/accept_profile.dart';

import 'accepted_profile_page.dart';

class LocatorPage extends StatefulWidget {
  const LocatorPage({Key? key}) : super(key: key);

  @override
  State<LocatorPage> createState() => LocatorPageState();
}

class LocatorPageState extends State<LocatorPage> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {
  };

  List<PersonData> people = PeopleData.people;

  Marker makeMarker(index){
    CameraPosition _currPos = CameraPosition(
        bearing: 192.8334901395799,
        target: people[index].l,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    return Marker(
      markerId: MarkerId('_marker' + index.toString()),
      infoWindow: InfoWindow(title: people[index].name),
      icon: BitmapDescriptor.defaultMarker,
      position: people[index].l,
    );
  }



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // Enable location services
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < people.length; i++){
      _markers.add(makeMarker(i));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 400,
          flexibleSpace: Stack(
            children: [
              GoogleMap(
                markers:Set<Marker>.of(_markers),
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                myLocationButtonEnabled: false,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        _goToOurLocation();
                      },
                      icon: Icon(
                        Icons.location_pin,
                        size: 45,
                        color: Colors.blue,
                      )),
                ),
              )
            ],
          )),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sharing With:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white70,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AcceptedProfilePage(
                                      personData: people[index]),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              people[index].imageUrl),
                                          radius: 20,
                                        )),
                                  ),
                                  Text(
                                    '${people[index].name}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _goToTheLocation(index);
                                    },
                                    icon: Icon(Icons.location_pin),
                                    iconSize: 34,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _goToOurLocation() async {
    final GoogleMapController controller = await _controller.future;
    Position position = await _determinePosition();
    LatLng posLat = LatLng(position.latitude, position.longitude);
    CameraPosition _currPos = CameraPosition(
        bearing: 192.8334901395799,
        target: posLat,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_currPos));
  }

  Future<void> _goToTheLocation(index) async {
    final GoogleMapController controller = await _controller.future;
    LatLng posLat = people[index].l;
    CameraPosition _currPos = CameraPosition(
        bearing: 192.8334901395799,
        target: posLat,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_currPos));
  }
}
