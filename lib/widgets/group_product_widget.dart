import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_pantry_flutter_app/models/group_product.dart';

class GroupProductWidget extends StatelessWidget {
  final GroupProduct groupProduct;
  final VoidCallback onTap;
  final VoidCallback longPress;

  const GroupProductWidget(
      {Key? key,
      required this.groupProduct,
      required this.onTap,
      required this.longPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weight = groupProduct.product.weight.toString();
    var volume = groupProduct.product.volume.toString();
    var quantity = groupProduct.quantity.toString();
    var expirationDate = "";
    if (groupProduct.product.expirationDate.isNotEmpty) {
      DateTime tempDate =
          DateFormat("yyyy.MM.dd").parse(groupProduct.product.expirationDate);
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
                    Text(groupProduct.product.name,
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
                Row(
                  children: [Text("Quantity: $quantity"), const Spacer()],
                ),
              ])),
        ),
      ),
    );
  }
}
