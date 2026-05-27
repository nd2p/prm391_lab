import 'package:flutter/material.dart';

import 'entities/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final products = Product.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Manager'),
        actions: [
          IconButton(
            onPressed: () {
              Product.reset();
              _refresh();
            },
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {
                  Product.add(
                    Product(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: 'New Product',
                      image: 'https://picsum.photos/200?new',
                      price: 100,
                    ),
                  );
                  _refresh();
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  final first = Product.find('1');
                  if (first != null) {
                    Product.edit(first.copyWith(name: '${first.name} Edited'));
                    _refresh();
                  }
                },
                child: const Text('Edit #1'),
              ),
              ElevatedButton(
                onPressed: () {
                  Product.increasePrice();
                  _refresh();
                },
                child: const Text('Increase 10%'),
              ),
              ElevatedButton(
                onPressed: () {
                  final found = Product.search('phone');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Search result: ${found.length} item(s)'),
                    ),
                  );
                },
                child: const Text('Search "phone"'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...products.map(
            (product) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(product.name.isNotEmpty ? product.name[0] : '?'),
                ),
                title: Text(product.name),
                subtitle: Text('ID: ${product.id}'),
                trailing: Text('\$${product.price.toStringAsFixed(2)}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
