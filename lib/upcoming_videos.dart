import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class UpcomingVideos extends StatefulWidget {
  const UpcomingVideos({
    Key? key,
  }) : super(key: key);
  @override
  State<UpcomingVideos> createState() => _UpcomingVideosState();
}

class _UpcomingVideosState extends State<UpcomingVideos> {
  List _items = [];
// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/upcoming_videos.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 17, right: 17),
      child: Card(
        color: Color.fromARGB(160, 255, 255, 255),
        elevation: 12,
        child: Column(
          children: [
            AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              animatedTexts: [
                TyperAnimatedText(
                  speed: Duration(milliseconds: 200),
                  textStyle: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 255, 196, 0)),
                  'Upcoming Videos On RequestedTopic',
                ),
              ],
            ),
            _items.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _items.length,
                    itemBuilder: ((BuildContext context, int index) {
                      return Container(
                        child: VeidoList(
                            id: _items[index]["id"],
                            tital: _items[index]["tital"],
                            videoUrl: _items[index]["link"],
                            description: _items[index]["description"],
                            image: _items[index]["image"]),
                      );
                    }))
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }
}

// // //////////////////////////////////////////////////////

// ////////////////////////////////////////////////
class VeidoList extends StatelessWidget {
  const VeidoList({
    Key? key,
    required this.id,
    required this.image,
    required this.tital,
    required this.videoUrl,
    required this.description,
  }) : super(key: key);

  final String tital;
  final String image;
  final String id;
  final String videoUrl;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            // Todo Add new videos Hare
            // 1stvideo
            VideoList(
                videoUrl: videoUrl, description: description, tital: tital),
          ],
        ),
      ],
    );
  }
}

class VideoList extends StatelessWidget {
  const VideoList({
    Key? key,
    required this.videoUrl,
    required this.description,
    required this.tital,
  }) : super(key: key);

  final String videoUrl;
  final String tital;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Link().launchURL(context: context, uri: videoUrl)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tital,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              description,
              maxLines: 5,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Color.fromARGB(139, 0, 0, 0),
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
