class ProductModel {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });
  factory ProductModel.fromJson(Map<String, dynamic> Json) {
    return ProductModel(
      id: Json['id'],
      title: Json['title'],
      slug: Json['slug'],
      price: Json['price'],
      description: Json['description'],
      category: Category.fromJson(Json['category']),

      // images: List<String>.from(Json['images']),
      images: Json['images'] != null ? List<String>.from(Json['images']) : [],

      creationAt: Json['creationAt'],
      updatedAt: Json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'category': category?.toJson(),
      'images': images,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> Json) {
    return Category(id: Json['id'], name: Json['name'], image: Json['image']);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }
}


// class Category {
//   int? id;
//   String? name;
//   String? slug;
//   String? image;
//   String? creationAt;
//   String? updatedAt;

//   Category({
//     required this.id,
//     required this.name,
//     required this.slug,
//     required this.image,
//     required this.creationAt,
//     required this.updatedAt,
//   });
//   factory Category.fromJson(Map<String, dynamic> Json) {
//     return Category(
//       id: Json['id'],
//       name: Json['name'],
//       slug: Json['slug'],
//       image: Json['image'],
//       creationAt: Json['creationAt'],
//       updatedAt: Json['updatedAt'],
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'slug': slug,
//       'image': image,
//       'creationAt': creationAt,
//       'updatedAt': updatedAt,
//     };
//   }
// }


