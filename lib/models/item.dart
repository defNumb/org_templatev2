class Item {
  int id;
  String name;
  String description;
  String category;
  String quantity;
  String price;
  String image;
  String dateAdded;
  String dateUpdated;
  String whoUpdated;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    required this.price,
    required this.image,
    required this.dateAdded,
    required this.dateUpdated,
    required this.whoUpdated,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      quantity: json['quantity'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      dateAdded: json['dateAdded'] as String,
      dateUpdated: json['dateUpdated'] as String,
      whoUpdated: json['whoUpdated'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'quantity': quantity,
      'price': price,
      'image': image,
      'dateAdded': dateAdded,
      'dateUpdated': dateUpdated,
      'whoUpdated': whoUpdated,
    };
  }
}
