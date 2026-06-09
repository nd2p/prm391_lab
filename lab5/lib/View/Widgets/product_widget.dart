import 'package:flutter/material.dart';
import 'package:flutter_prm/product.dart';
import 'package:flutter_prm/View/Pages/product_detail_page.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool? isLike = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: widget.product),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ảnh sản phẩm
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.network(widget.product.image),
                      ),
                      FloatingActionButton.extended(
                        heroTag: null,
                        onPressed: () {},
                        label: const Text("Add to Cart"),
                        icon: const Icon(Icons.shopping_cart),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Product Name: ${widget.product.name}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Price: ${widget.product.price.toStringAsFixed(2)}\$",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isLike = !(isLike ?? false);
                            });
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: (isLike ?? false)
                                ? Colors.yellow
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "6.7",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  for (int i = 0; i <= 5; i++)
                    Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 4),
                ],
              ),

              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      '"Brainrot" (tạm dịch: thối não) là thuật ngữ mạng xã hội mô tả tình trạng sa sút nhận thức do tiêu thụ quá mức các nội dung trực tuyến vô nghĩa, lặp đi lặp lại. Hiện nay, "Brainrot" còn là một vũ trụ meme tạo bởi AI, thu hút giới trẻ nhờ hình ảnh siêu thực và âm thanh gây nghiện.',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
