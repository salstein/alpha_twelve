import 'package:alpha_twelve/src/features/cart/models/cart_object_dto.dart';

class ProductListModel {
  final List<ProductModel> products;

  const ProductListModel({required this.products});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      products: (json['products'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
      };

  ProductListModel copyWith({List<ProductModel>? products}) {
    return ProductListModel(products: products ?? this.products);
  }

  factory ProductListModel.empty() => const ProductListModel(products: []);
}

class ProductModel {
  final int id;
  final String name;
  final String extra;
  final String color;
  final double price;
  final List<String> descriptions;
  final String imageUrl;

  const ProductModel({
    required this.id,
    required this.name,
    required this.extra,
    required this.color,
    required this.price,
    required this.descriptions,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      extra: json['extra'],
      color: json['color'],
      price: (json['price'] as num).toDouble(),
      descriptions: List<String>.from(json['descriptions']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'extra': extra,
        'color': color,
        'price': price,
        'descriptions': descriptions,
        'imageUrl': imageUrl,
      };

  ProductModel copyWith({
    int? id,
    String? name,
    String? extra,
    String? color,
    double? price,
    List<String>? descriptions,
    String? imageUrl,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      extra: extra ?? this.extra,
      color: color ?? this.color,
      price: price ?? this.price,
      descriptions: descriptions ?? this.descriptions,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory ProductModel.empty() => const ProductModel(
        id: 0,
        name: '',
        extra: '',
        color: '',
        price: 0.0,
        descriptions: [],
        imageUrl: '',
      );
}

/// Product to cartItem

extension ProductToCartItem on ProductModel {
  CartItem toCartItem({int quantity = 1}) {
    return CartItem(
      productId: id,
      name: "$name $extra|$color",
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }
}
