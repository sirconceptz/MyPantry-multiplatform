import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    var weight = product.weight.toString();
    var volume = product.volume.toString();
    var expirationDate = "";
    if(product.expirationDate.isNotEmpty) {
      DateTime tempDate = DateFormat("yyyy.MM.dd").parse(product.expirationDate);
      expirationDate = DateFormat.yMEd().format(tempDate);
    }

    return InkWell(
      onLongPress: longPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: Card(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Row(
                  children: [
                    Text(product.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("Expiration date: $expirationDate")
                  ],
                ),
                Row(
                  children: [
                    Text("Weight: $weight", textAlign: TextAlign.start),
                    const Spacer()
                  ],
                ),
                Row(
                  children: [Text("Volume: $volume"), const Spacer()],
                ),
              ])),
        ),
      ),
    );
  }
}
