import 'package:flutter/material.dart';
import 'package:midterm_s2025/Product/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Expanded(
              child: Image.network(
                widget.product.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        color: Color.fromARGB(255, 219, 212, 254),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                            widget.product.category.toUpperCase(),
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: 15,
                      ),
                      Text(
                        widget.product.rating.rate.toString(),
                        style: TextStyle(
                          // color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.product.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ ${widget.product.price.toString()}',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  TextButton(onPressed: (){}, 
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 247, 240, 250),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.deepPurple,
                          size: 20,
                        ),
                        Text(
                          ' Add to cart',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}
