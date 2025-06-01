import 'package:alpha_twelve/src/routing/routing.dart';
import 'package:alpha_twelve/src/style/theme/typography/typography.dart';
import 'package:flutter/material.dart';

import '../../../product/models/product_response_dto.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoute.productDetailsScreen.name,
          pathParameters: {'id': product.id.toString()},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                   tag: 'product-${product.id}',
                  child: Image.asset(product.imageUrl, fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${product.name}\n${product.extra}|${product.color}",
              style: context.bodySmall?.regular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
