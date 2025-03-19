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
        // color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.network(
                widget.product.image,
                width: double.infinity,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: TextStyle(
                      fontSize: 13,
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
                          color: Colors.black,
                        ),
                      ),
                      // Spacer(),
                      // Stars(
                      //   rating: product.rating.rate.toDouble(),
                      //   size: 15,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    // return Card(
    //   child: Column(
    //     children: [
    //       Text(widget.obj.name ?? 'Default Name'),
    //       Text(widget.obj.obj),
    //     ],
    //   )
    //   // margin: const EdgeInsets.all(10),
    //   // child: Column(
    //   //   children: <Widget>[
    //   //     ListTile(
    //   //       title: Text(widget.obj.name),
    //   //       subtitle: Text(widget.obj.description),
    //   //       trailing: IconButton(
    //   //         icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
    //   //         onPressed: () {
    //   //           setState(() {
    //   //             isExpanded = !isExpanded;
    //   //           });
    //   //         },
    //   //       ),
    //   //     ),
    //   //     if (isExpanded)
    //   //       Padding(
    //   //         padding: const EdgeInsets.all(16),
    //   //         child: Text(widget.obj.description),
    //   //       ),
    //   //   ],
    //   // ),
    // );
  }
}