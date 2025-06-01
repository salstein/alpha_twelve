class CartItem {
  final int productId;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({
    int? productId,
    String? name,
    String? imageUrl,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => price * quantity;

  factory CartItem.empty() => const CartItem(
        productId: 0,
        name: '',
        imageUrl: '',
        price: 0.0,
        quantity: 0,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'name': name,
        'imageUrl': imageUrl,
        'price': price,
        'quantity': quantity,
      };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json['productId'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        price: (json['price'] as num).toDouble(),
        quantity: json['quantity'],
      );
}
