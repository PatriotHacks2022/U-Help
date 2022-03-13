class PersonData {
  String id = "";
  String imageUrl = "";
  String title = "";
  String note = "";
  String name = "";
  String uid = "";
  String location = "";
  PersonData({
    required this.id,
    required this.imageUrl,
    required this.uid,
    required this.name,
    required this.note,
    required this.location});

  String getProductTitle() {
    return title;
  }
}