class FurnitureModel {
  String title;
  String description;
  String category;
  String price;
  String rating;
  List<dynamic> reviews;
  String qrCode;
  List<dynamic> image;
  List<dynamic> colors;

  FurnitureModel({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.qrCode,
    required this.image,
    required this.colors,
  });

  static furnitureFromMap(Map<String, dynamic> map) {
    return FurnitureModel(
      title: map['title'],
      description: map['description'],
      category: map['category'],
      price: map['price'],
      rating: map['rating'],
      reviews: map['reviews'],
      qrCode: map['qrQode'],
      image: map['image'],
      colors: map['colors'],
    );
  }
}
