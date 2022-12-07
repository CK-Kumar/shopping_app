import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;
  const ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishList = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/product', arguments: product),
      child: Stack(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition + 5,
            child: Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5 - 10,
                height: 70,
                decoration: const BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            Product.products[0].price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.add_circle),
                        ),
                      ),
                      isWishList
                          ? Expanded(
                              child: IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.delete),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
