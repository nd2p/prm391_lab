import 'package:flutter/material.dart';
import 'package:flutter_prm/View/Widgets/product_widget.dart';
import 'package:flutter_prm/product.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});
  final List<Product> products = Product.list;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 450) {
          // Narrow screens: 1 column
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ProductWidget(product: products[index]),
              );
            },
          );
        } else {
          // Wide screens: 2 columns
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 500, // Matches height of ProductWidget
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductWidget(product: products[index]);
            },
          );
        }
      },
    );
  }
}
