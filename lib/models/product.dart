class Product {
  final int id;
  // ignore: prefer_typing_uninitialized_variables
  final price;
  final String title, description, category, image;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        price: json['price'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        image: json['image']
    );
  }
}
