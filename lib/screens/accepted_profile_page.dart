import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:swipe_shop_flutter/custom_components/custom_accept_profile_card.dart';
import 'package:swipe_shop_flutter/custom_components/custom_location_profile_card.dart';
import 'package:swipe_shop_flutter/custom_components/custom_swipe_product_card.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';
import 'package:swipe_shop_flutter/providers/card_provider.dart';

class AcceptedProfilePage extends StatefulWidget {

  const AcceptedProfilePage({Key? key, required this.personData}) : super(key: key);

  final PersonData personData;

  @override
  _AcceptedProfilePageState createState() => _AcceptedProfilePageState();
}

class _AcceptedProfilePageState extends State<AcceptedProfilePage> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return ChangeNotifierProvider<CardProvider>(
      create: (context) => CardProvider(),
      builder: (ctx, snapshot) {
        return Container(
          color: isDarkMode ? Colors.black : Colors.white,
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: Column(
                children: [
                  Expanded(
                      child: AnimatedPadding(
                        padding: const EdgeInsets.all(0),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Container(
                          child: buildCards(ctx),
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCards(ctx){
    final provider = Provider.of<CardProvider>(ctx);
    final urlImages = provider.urlImages;

    return Stack(
      children: urlImages
          .map((urlImage) =>
          CustomLocationProfileCard(
            urlImage: widget.personData.imageUrl,
            name: widget.personData.name,
            uid: widget.personData.uid,
            location: widget.personData.location,
            note: widget.personData.note,
            isFront : urlImages.last == urlImage,
          ))
          .toList(),
    );
  }

  bool isExpanded(ctx){
    final provider = Provider.of<CardProvider>(ctx);
    return provider.isExpanded;
  }
}