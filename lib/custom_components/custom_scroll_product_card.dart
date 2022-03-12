import 'package:flutter/material.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';
import 'package:swipe_shop_flutter/screens/profile_page.dart';

class CustomScrollProductCard extends StatelessWidget {
  const CustomScrollProductCard({Key? key, required this.personData})
      : super(key: key);

  final PersonData personData;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SwipePage(personData: personData,),
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: isDarkMode ? Colors.white : Colors.black),
                      alignment: Alignment.center,
                      child:
                      Image.network(personData.imageUrl, fit: BoxFit.fill),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10, top: 5),
                        child: Icon(
                          Icons.more_horiz,
                          size: 24,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(personData.imageUrl),
                            radius: 20,
                          )),
                    ),
                  ],
                )),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
          /*ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(productData.imageUrl, fit: BoxFit.fill),
        ),*/
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.grey,
                  size: 16,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  personData.location,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              personData.name,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
