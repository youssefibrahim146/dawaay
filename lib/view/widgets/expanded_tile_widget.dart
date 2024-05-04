import 'package:dawaay/constants/dawaay_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class ExpandedTileWidget extends StatelessWidget {
  final ExpandedTileController controller;
  final String title, content;

  const ExpandedTileWidget(
      {super.key,
      required this.controller,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: DawaayColors.kprimaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ExpandedTile(
        theme: const ExpandedTileThemeData(
          contentPadding: EdgeInsets.all(10),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        controller: controller,
      ),
    );
  }
}
