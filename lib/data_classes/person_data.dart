class PersonData {
  String id = "";
  String imageUrl = "";
  String title = "";
  String note = "";
  String name = "";
  String location = "";
  PersonData({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.note,
    required this.location});

  String getProductTitle() {
    return title;
  }
}