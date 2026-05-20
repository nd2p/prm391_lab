class Product {
  final String id;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      price: (json['price'] as num).toDouble(),
    );
  }

  Product copyWith({String? id, String? name, String? image, double? price}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'price': price};
  }

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Laptop',
      image: 'https://picsum.photos/200?1',
      price: 1500,
    ),
    Product(
      id: '2',
      name: 'Phone',
      image: 'https://picsum.photos/200?2',
      price: 900,
    ),
    Product(
      id: '3',
      name: 'Headphone',
      image: 'https://picsum.photos/200?3',
      price: 120,
    ),
  ];

  static void add(Product product) {
    products.add(product);
  }

  static bool edit(Product product) {
    final index = products.indexWhere((item) => item.id == product.id);
    if (index == -1) {
      return false;
    }

    products[index] = product;
    return true;
  }

  static List<Product> search(String keyword) {
    final lowerKeyword = keyword.toLowerCase();
    return products
        .where(
          (product) =>
              product.id.toLowerCase().contains(lowerKeyword) ||
              product.name.toLowerCase().contains(lowerKeyword),
        )
        .toList();
  }

  static Product? find(String id) {
    for (final product in products) {
      if (product.id == id) {
        return product;
      }
    }
    return null;
  }

  static List<Product> increasePrice() {
    products = products
        .map((product) => product.copyWith(price: product.price * 1.1))
        .toList();
    return products;
  }

  static void reset() {
    products = [
      Product(
        id: '1',
        name: 'Laptop',
        image: 'https://picsum.photos/200?1',
        price: 1500,
      ),
      Product(
        id: '2',
        name: 'Phone',
        image: 'https://picsum.photos/200?2',
        price: 900,
      ),
      Product(
        id: '3',
        name: 'Headphone',
        image: 'https://picsum.photos/200?3',
        price: 120,
      ),
    ];
  }
}
