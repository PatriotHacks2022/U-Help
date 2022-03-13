import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swipe_shop_flutter/providers/card_provider.dart';
import 'package:swipe_shop_flutter/utils/firebase_authentication/fire_auth.dart';

class CustomLocationProfileCard extends StatefulWidget {
  final String urlImage;
  final String location;
  final String name;
  final String uid;
  final String note;
  final bool isFront;

  const CustomLocationProfileCard({
    Key? key,
    required this.urlImage,
    required this.name,
    required this.uid,
    required this.location,
    required this.note,
    required this.isFront,
  }) : super(key: key);

  @override
  State<CustomLocationProfileCard> createState() {
    return _CustomLocationProfileCardState();
  }
}

class _CustomLocationProfileCardState extends State<CustomLocationProfileCard> {
  bool isExpanded = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

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
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var userRef = users.doc(widget.uid);
    try{
      //userRef.update({"requests": FieldValue.arrayUnion([auth.currentUser?.uid])});
    }catch (e){
      throw(e);
    }
  }

  Widget chooseCard(provider, context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: provider.isExpanded ? Colors.white : Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.2,
            child: buildExpandedCard(context),
          ),
          Expanded(
            child: Padding(
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.withOpacity(0.2),
                      shadowColor: Colors.transparent,
                      // makes buttons round.
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // makes button height 50 and matches width
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Message',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.withOpacity(0.2),
                      shadowColor: Colors.transparent,
                      // makes buttons round.
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // makes button height 50 and matches width
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      acceptRequest();
                    },
                    child: const Text(
                      'Remove Location Access',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
