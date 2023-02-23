class Book {
  final int id;
  final String title;
  final String author;
  final double price;
  final String imageUrl;

  const Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.price,
      required this.imageUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        title: json["description"],
        author: json["author"],
        price: json["price"] as double,
        imageUrl: json["image-url"]);
  }
}
