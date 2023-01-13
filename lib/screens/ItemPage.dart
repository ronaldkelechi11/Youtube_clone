import 'package:flutter/material.dart';
import 'package:youtube_clone/models/Upload.dart';
import 'package:youtube_clone/widgets/ItemPageWidgets.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key, required this.upload}) : super(key: key);
  final Upload upload;

  @override
  Widget build(BuildContext context) {
    return ItemPageWidgets(
      upload: upload ,
    );
  }
}
