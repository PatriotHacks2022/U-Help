import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swipe_shop_flutter/providers/card_provider.dart';

class CustomSwipeProductCard extends StatefulWidget {
  final String urlImage;
  final bool isFront;

  const CustomSwipeProductCard({
    Key? key,
    required this.urlImage,
    required this.isFront,
  }) : super(key: key);

  @override
  State<CustomSwipeProductCard> createState() {
    return _CustomSwipeProductCardState();
  }
}

class _CustomSwipeProductCardState extends State<CustomSwipeProductCard> {
  bool isExpanded = false;

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
      child: widget.isFront ? buildFrontCard() : chooseCard(provider, context),
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

      onTap: (){
        final provider = Provider.of<CardProvider>(context, listen: false);
        print("tappedd");
        provider.expandCard();
      },
      onPanStart: (details) {
        // happens when card is first pressed
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        // happens when card is moving
        final provider = Provider.of<CardProvider>(context, listen: false);
        if (!provider.isExpanded) {
          provider.updatePosition(details);
        }
      },
      onPanEnd: (details) {
        // happens when card is let go
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.endPosition();
      },
    );
  }

  Widget buildCard(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Test",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      Text(
                        "Test",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      Text(
                        "Test",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
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
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.urlImage),
              fit: BoxFit.cover,
              alignment: const Alignment(-.3, 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildExpandedCard(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.urlImage),
            fit: BoxFit.cover,
            alignment: const Alignment(-.3, 1),
          ),
        ),
      ),
    );
  }

  Widget chooseCard(provider, context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor:
            provider.isExpanded ? Colors.white : Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics:  provider.isExpanded ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
                children: [
                  AnimatedContainer(
                    color: Colors.transparent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: MediaQuery.of(context).size.width,
                    height: provider.isExpanded
                        ? MediaQuery.of(context).size.height / 2.2
                        : MediaQuery.of(context).size.height / 1.22,
                    child:
                        provider.isExpanded ? buildExpandedCard(context) : buildCard(context),
                  ),
                  if (provider.isExpanded)
                    Column(
                      children: [
                        Text("Test"),
                        Text("Test"),
                        Text("Test"),
                        SizedBox(
                          height: 400,
                        ),
                        Text("Test"),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
