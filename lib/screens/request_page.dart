import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swipe_shop_flutter/data_classes/people_data.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';
import 'package:swipe_shop_flutter/screens/accept_profile.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  List<PersonData> people = PeopleData.people;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text("Requests",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Expanded(child: ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height:70,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white70,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AcceptProfilePage(personData: people[index]),
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
                                        backgroundImage: NetworkImage(people[index].imageUrl),
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
                                  icon: Icon(Icons.close_outlined,
                                  color: Colors.black,),
                                  onPressed: () {
                                    setState(() {
                                      people.removeAt(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    );
                  }
              ),)
            ],
          ),
        )
      )
    );
  }
}