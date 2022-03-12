class ProductData {
  String id = "";
  String imageUrl = "";
  String title = "";
  String description = "";
  String price = "";
  String location = "";
  ProductData({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.location});

  String getProductTitle() {
    return title;
  }
}