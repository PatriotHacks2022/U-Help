import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:swipe_shop_flutter/providers/card_provider.dart';
import 'package:swipe_shop_flutter/screens/request_page.dart';
import 'package:swipe_shop_flutter/utils/firebase_authentication/fire_auth.dart';

class CustomMyProfileCard extends StatefulWidget {
  final String urlImage;
  final String location;
  final String name;
  final String uid;
  final String note;
  final bool isFront;

  const CustomMyProfileCard({
    Key? key,
    required this.urlImage,
    required this.name,
    required this.uid,
    required this.location,
    required this.note,
    required this.isFront,
  }) : super(key: key);

  @override
  State<CustomMyProfileCard> createState() {
    return _CustomMyProfileCardState();
  }
}

class _CustomMyProfileCardState extends State<CustomMyProfileCard> {
  bool isExpanded = false;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // get the size of the screen
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);

      // set the size of the screen in the provider.
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context, listen: true);
    return SizedBox.expand(
      child: buildFrontCard(),
    );
  }

  Widget buildFrontCard() {
    return GestureDetector(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final provider = Provider.of<CardProvider>(context, listen: true);
          final position = provider.position;

          // time it takes card to move positions.
          final milliseconds = provider.isDragging ? 0 : 400;

          // set the angle of the card.
          final angle = provider.angle * pi / 180;

          // get center constraints of card.
          final center = constraints.smallest.center(Offset.zero);

          // rotate card based off its direction and distance from the center
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);

          return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: milliseconds),
            transform: rotatedMatrix..translate(position.dx, position.dy),
            child: chooseCard(provider, context), //buildCard()
          );
        },
      ),
      onTap: () {
        final provider = Provider.of<CardProvider>(context, listen: false);
        //provider.expandCard();
      },
      onPanStart: (details) {
        // happens when card is first pressed
        final provider = Provider.of<CardProvider>(context, listen: false);
        //provider.startPosition(details);
      },
      onPanUpdate: (details) {
        // happens when card is moving
        final provider = Provider.of<CardProvider>(context, listen: false);
        if (!provider.isExpanded) {
          //provider.updatePosition(details);
        }
      },
      onPanEnd: (details) {
        // happens when card is let go
        final provider = Provider.of<CardProvider>(context, listen: false);
        //provider.endPosition();
      },
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

  Widget buildExpandedCard(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 36, 0, 0),
              child: IconButton(
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_back,
                  color: isDarkMode ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  // go back to scrolling
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0xff000000),
              Color(0x80000000),
              Color(0x40000000),
              Color(0x00000000),
            ],
          ),
          image: DecorationImage(
            image: NetworkImage(widget.urlImage),
            fit: BoxFit.cover,
            alignment: const Alignment(-.3, 1),
          ),
        ),
      ),
    );
  }

  void acceptRequest() async{

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

  Widget chooseCard(provider, context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    _goToOurLocation();
    return Scaffold(
      backgroundColor: provider.isExpanded ? Colors.white : Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.2,
            child: buildExpandedCard(context),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Note: ${widget.note}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),

                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.withOpacity(0.2),
                    shadowColor: Colors.transparent,
                    // makes buttons round.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // makes button height 50 and matches width
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RequestPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Requests',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
