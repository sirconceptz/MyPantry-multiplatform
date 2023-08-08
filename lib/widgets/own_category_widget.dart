import 'package:flutter/material.dart';
import 'package:my_pantry_flutter_app/models/own_category.dart';

class OwnCategoryWidget extends StatelessWidget {
  final OwnCategory ownCategory;
  final VoidCallback onTap;
  final VoidCallback longPress;

  const OwnCategoryWidget(
      {Key? key,
      required this.ownCategory,
      required this.onTap,
      required this.longPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: longPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(ownCategory.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(ownCategory.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
