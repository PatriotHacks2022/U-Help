import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:swipe_shop_flutter/custom_components/custom_accept_profile_card.dart';
import 'package:swipe_shop_flutter/custom_components/custom_my_profile_card.dart';
import 'package:swipe_shop_flutter/custom_components/custom_swipe_product_card.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';
import 'package:swipe_shop_flutter/providers/card_provider.dart';

class MyProfilePage extends StatefulWidget {

  const MyProfilePage({Key? key, required this.personD}) : super(key: key);
  final String personD;

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
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
          CustomMyProfileCard(
            urlImage: "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=2070&amp;q=80",
            name: "My name",
            uid: "",
            location: "",
            note: "Here a user can write a short bio or include any information they may want to provide.",
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