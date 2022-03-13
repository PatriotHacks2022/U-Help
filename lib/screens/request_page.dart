import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  List<String> people = [
    "David",
    "Javier",
    "Katelyn",
    "Arian",
    "Adam"
  ];

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height:60,
              child: Card(
                  child:  Row(
                    children: [
                      Text(
                          people[index],
                          style: TextStyle(fontSize: 20),
                      ),
                      Expanded(
                          child: Container(),
                      ),
                      IconButton(
                          icon: Icon(Icons.close_outlined),
                          onPressed: () {
                            setState(() {
                              people.removeAt(index);
                            });
                          },
                      ),
                    ],
                  )
              ),
            );
          }
      ),
    );
  }
}
