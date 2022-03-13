import 'package:google_maps_flutter/google_maps_flutter.dart';

class PersonData {
  String id = "";
  String imageUrl = "";
  String title = "";
  String note = "";
  String name = "";
  String uid = "";
  String location = "";
  LatLng l = LatLng(0, 0);
  List requests = [];
  List accepted = [];
  PersonData({
    required this.id,
    required this.imageUrl,
    required this.uid,
    required this.name,
    required this.note,
    required this.location,
    required this.l,
  });

  String getProductTitle() {
    return title;
  }

  static PersonData fromJson(Map<String, dynamic> json){
    return PersonData(id: "",
        imageUrl: "",
        uid: "",
        name: "",
        note: "",
        location: "",
        l:LatLng(0, 0));
  }
}