import 'package:flutter/material.dart';
import 'package:youtube_clone/models/Upload.dart';
import 'package:youtube_clone/screens/ItemPage.dart';

const _sections = [
  "All",
  "Live",
  "Gaming",
  "Music",
  "Mixes",
  "Bleach",
  "Apple",
  "Manga",
  "Apex Legends",
  "Drill Music",
  "Call of Duty: Mobile",
  "Warzone"
];
List<Upload> videoItems = [
  Upload("Buildidng the highest building in Minecraft", "minecraft.png",
      "Mr.Beast", "06:58", "", "1.5M views", "8hrs ago"),
  Upload("You'll definetly fall asleep", "asmr.jpg", "Batala's ASMR", "45:00",
      "", "85k views", "22hrs ago"),
  Upload("Raced against top drivers in GTA V: RP to win a grand prize",
      "racing.jpg", "Furious Fade", "15:58", "", "334k views", "10hrs ago"),
  Upload("Multiple squad wipes with new Hierloom", "", "FaZe Destroying",
      "30:40", "", "354k views", "5hrs ago"),
  Upload("BR-Ranked world record with new Skin", "", "Post M@lone", "30:40", "",
      "3.4M views", "10days ago")
];

customAppBar() {
  return AppBar(
    title: const Text("YouTube",
        style: TextStyle(fontSize: 24, color: Colors.white)),
    backgroundColor: Colors.grey.shade900,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
            size: 24,
          )),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
            size: 24,
          )),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 24,
          )),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_outline_rounded,
            size: 24,
          )),
    ],
  );
}

// Body of the Screen
myBody() {
  return Container(
    color: Colors.grey.shade900,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [section(), videos()],
    ),
  );
}

section() {
  return Container(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _sections.length,
      itemBuilder: (BuildContext context, int index) {
        return _sectionItem(item: _sections[index]);
      },
    ),
  );
}

// The custom Section item
_sectionItem({required String item}) {
  return Container(
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade500)),
    child: Center(
      child: Text(
        item,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    ),
  );
}

videos() {
  return Expanded(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videoItems.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemPage(
                          upload: videoItems[index],
                        )));
          },
          child: _videoItem(upload: videoItems[index]),
        );
      },
    ),
  );
}

// Custom Video Element
_videoItem({required Upload upload}) {
  return Builder(builder: (context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(upload.thumbnail), fit: BoxFit.fill)),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                color: Colors.grey[900],
                child: Text(
                  upload.videoLength,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(360),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    upload.videoName,
                    overflow: TextOverflow.ellipsis,
                    style: myTextStyle(size: 16, fontColor: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Text(upload.author,
                            style: myTextStyle(
                              size: 14,
                              fontColor: Colors.grey.shade300,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(upload.videoViews,
                            style: myTextStyle(
                              size: 14,
                              fontColor: Colors.grey.shade300,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(upload.timePOSTED,
                            style: myTextStyle(
                              size: 14,
                              fontColor: Colors.grey.shade300,
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  });
}

TextStyle myTextStyle({required double size, required Color fontColor}) {
  return TextStyle(
    fontSize: size,
    color: fontColor,
  );
}
