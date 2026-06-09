class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;

  // Constructor
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  // copyWith method to help with immutable edits
  Product copyWith({String? id, String? name, String? image, double? price}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description,
    );
  }

  // Factory constructor to map JSON to Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
    );
  }

  // Convert Product to JSON map (optional but useful)
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'price': price};
  }

  // Static list of products with default values
  static List<Product> list = [
    Product(
      id: "1",
      name: 'Essence Mascara Lash Princess',
      image:
          'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp',
      description:
          'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.',
      price: 9.99,
    ),
    Product(
      id: "2",
      name: 'Eyeshadow Palette with Mirror',
      image:
          'https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/thumbnail.webp',
      description:
          'The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it is convenient for on-the-go makeup application.',
      price: 19.99,
    ),
    Product(
      id: "3",
      name: 'Powder Canister',
      image:
          'https://cdn.dummyjson.com/product-images/beauty/powder-canister/thumbnail.webp',
      description:
          'The Powder Canister is a finely milled setting powder designed to set makeup and control shine. It provides a smooth and matte finish.',
      price: 14.99,
    ),
    Product(
      id: "4",
      name: 'Red Lipstick',
      image:
          'https://cdn.dummyjson.com/product-images/beauty/red-lipstick/thumbnail.webp',
      description:
          'The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. It provides a vibrant and long-lasting finish.',
      price: 12.99,
    ),
    Product(
      id: "5",
      name: 'Red Nail Polish',
      image:
          'https://cdn.dummyjson.com/product-images/beauty/red-nail-polish/thumbnail.webp',
      description:
          'The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. It provides a salon-quality finish at home.',
      price: 8.99,
    ),
    Product(
      id: "6",
      name: 'Calvin Klein CK One',
      image:
          'https://cdn.dummyjson.com/product-images/fragrances/calvin-klein-ck-one/thumbnail.webp',
      description:
          'CK One by Calvin Klein is a classic unisex fragrance known for its fresh and clean scent. Suitable for everyday wear.',
      price: 49.99,
    ),
    Product(
      id: "7",
      name: 'Chanel Coco Noir Eau De',
      image:
          'https://cdn.dummyjson.com/product-images/fragrances/chanel-coco-noir-eau-de/thumbnail.webp',
      description:
          'Coco Noir by Chanel is an elegant and mysterious fragrance featuring notes of grapefruit, rose, and sandalwood.',
      price: 129.99,
    ),
    Product(
      id: "8",
      name: "Dior J'adore",
      image:
          "https://cdn.dummyjson.com/product-images/fragrances/dior-j'adore/thumbnail.webp",
      description:
          'J’adore by Dior is a luxurious floral fragrance known for its blend of ylang-ylang, rose, and jasmine.',
      price: 89.99,
    ),
    Product(
      id: "9",
      name: 'Dolce Shine Eau de',
      image:
          'https://cdn.dummyjson.com/product-images/fragrances/dolce-shine-eau-de/thumbnail.webp',
      description:
          'Dolce Shine by Dolce & Gabbana is a vibrant and fruity fragrance featuring notes of mango, jasmine, and blonde woods.',
      price: 69.99,
    ),
    Product(
      id: "10",
      name: 'Gucci Bloom Eau de',
      image:
          'https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/thumbnail.webp',
      description:
          'Gucci Bloom is a floral and captivating fragrance with notes of tuberose, jasmine, and Rangoon creeper.',
      price: 79.99,
    ),
  ];

  // Method to find a product by ID
  static Product? find(String id) {
    try {
      return list.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search and Filter method (flexible / diverse criteria)
  static List<Product> search({
    String? query,
    double? minPrice,
    double? maxPrice,
  }) {
    return list.where((product) {
      // Filter by name/query
      if (query != null && query.isNotEmpty) {
        final matchesName = product.name.toLowerCase().contains(
          query.toLowerCase(),
        );
        final matchesId = product.id.toLowerCase().contains(
          query.toLowerCase(),
        );
        if (!matchesName && !matchesId) return false;
      }
      // Filter by min price
      if (minPrice != null && product.price < minPrice) {
        return false;
      }
      // Filter by max price
      if (maxPrice != null && product.price > maxPrice) {
        return false;
      }
      return true;
    }).toList();
  }
}
