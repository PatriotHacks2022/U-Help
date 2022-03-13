import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';
import 'package:swipe_shop_flutter/screens/accept_profile.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  List<PersonData> people = [
    PersonData(
        id: 'id-001',
        imageUrl: 'https://picsum.photos/seed/image006/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Adam Abu",
        note: "A cool watch",
        location: "Alexandria, VA"),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Amaazing car window!",
        location: "Fairfax, VA"),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Something else",
        location: "France"),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://picsum.photos/seed/image002/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "A cool watch",
        location: "Alexandria, VA"),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Amaazing car window!",
        location: "Fairfax, VA"),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "Something else",
        location: "France"),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://picsum.photos/seed/image002/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "Javier Talavera",
        note: "A cool watch",
        location: "Alexandria, VA"),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Amaazing car window!",
        location: "Fairfax, VA"),
    PersonData(
        id: 'id-003',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        imageUrl: 'https://i.imgur.com/9h66HBP.png',
        name: "100",
        note: "Something else",
        location: "France"),
    PersonData(
        id: 'id-001',
        imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "A cool watch",
        location: "Alexandria, VA"),
    PersonData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Amaazing car window!",
        location: "Fairfax, VA"),
    PersonData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        uid: "JUzTASdR6DXt4pzSW5NfWjugy923",
        name: "100",
        note: "Something else",
        location: "France"),
  ];

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