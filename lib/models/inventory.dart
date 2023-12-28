// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:org_templatev2/models/item.dart';

class Inventory {
  final String name;
  final String description;
  final String category;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final List<Item> items = <Item>[];
  Inventory({
    required this.name,
    required this.description,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'category': category,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userId': userId,
    };
  }

  factory Inventory.fromJson(Map<String, dynamic> map) {
    return Inventory(
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      userId: map['userId'] as String,
    );
  }
}
