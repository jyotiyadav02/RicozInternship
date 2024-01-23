class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}

class ProductModelList {
  final List<ProductModel> ProductModels;
  final int total;
  final int skip;
  final int limit;

  ProductModelList({
    required this.ProductModels,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModelList.fromJson(Map<String, dynamic> json) {
    List<ProductModel> ProductModels = [];
    if (json['ProductModels'] != null) {
      ProductModels = List<ProductModel>.from(
        (json['ProductModels'] as List).map(
          (ProductModel) => ProductModel.fromJson(ProductModel),
        ),
      );
    }

    return ProductModelList(
      ProductModels: ProductModels,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}



// class ProductModel {
//   int id;
//   String title;
//   String description;
//   double price;
//   double discountPercentage;
//   double rating;
//   double stock;
//   String brand;
//   String category;
//   String thumbnail;
//   List<String> images;

//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.stock,
//     required this.brand,
//     required this.category,
//     required this.thumbnail,
//     required this.images,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["id"],
//         title: json['title'],
//         description: json["description"],
//         price: (json["price"] as num).toDouble(),
//         discountPercentage: (json["discountPercentage"] as num).toDouble(),
//         rating: (json["rating"] as num).toDouble(),
//         stock: (json["stock"] as num).toDouble(),
//         brand: json["brand"],
//         category: json["category"],
//         thumbnail: json["thumbnail"],
//         images: List<String>.from(json["images"].map((x) => x)),
//       );
// }
