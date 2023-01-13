import 'package:flutter/material.dart';
import 'package:youtube_clone/models/Upload.dart';

class ItemPageWidgets extends StatelessWidget {
  const ItemPageWidgets({Key? key, required this.upload}) : super(key: key);
  final Upload upload;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(upload.thumbnail), fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}
