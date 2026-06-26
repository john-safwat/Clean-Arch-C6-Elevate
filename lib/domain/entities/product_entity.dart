class ProductEntity {
  List<String> image;
  int ratingsQuantity;
  String id;

  String title;
  String slug;
  String description;
  int quantity;
  num price;

  String imageCover;

  double ratingAverage;

  ProductEntity({
    required this.image,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.ratingAverage,
  });
}
