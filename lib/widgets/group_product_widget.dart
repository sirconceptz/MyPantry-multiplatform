import 'package:flutter/material.dart';

import '../models/product.dart';

class GroupProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback longPress;

  const GroupProductWidget(
      {Key? key,
      required this.product,
      required this.onTap,
      required this.longPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: longPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: Card(
          child: Column(children: [Text(product.name)]),
        ),
      ),
    );
  }
}
