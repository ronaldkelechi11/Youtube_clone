// ignore: file_names
import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/HomeWidgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: myBody(),
    );
  }
}
