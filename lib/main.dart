import 'package:flutter/material.dart';
import 'package:profile/footer.dart';
import 'package:profile/upcoming_videos.dart';
import 'package:profile/yt_videos.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:parallax_rain/parallax_rain.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  String gitHub = "https://github.com/mrroccky/";

  String whatsapp = "https://chat.whatsapp.com/IVlbM2X0Es3AXgWAzvvQuu/";

  String facebook = "https://www.facebook.com/oncrring";

  String teligram = "https://t.me/oncrring";

  String tweeter = "https://twitter.com/oncrring";

  String linkedIn = "https://www.instagram.com/oncrring_/";

  String instagram = "https://www.instagram.com/mrroccky/";

  String youTube = "https://www.youtube.com/@mrroccky";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ParallaxRain(
          trail: true,
          dropFallSpeed: 0.5,
          rainIsInBackground: true,
          numberOfDrops: 100,
          dropColors: const [
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.yellow,
            Colors.brown,
            Colors.blueGrey,
            Colors.black
          ],
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  color: Color.fromARGB(160, 255, 255, 255),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  elevation: 12,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (() =>
                            Link().launchURL(context: context, uri: gitHub)),
                        child: const AvatarGlow(
                          endRadius: 100,
                          glowColor: Color.fromARGB(255, 241, 80, 5),
                          repeatPauseDuration: Duration(milliseconds: 10),
                          duration: Duration(milliseconds: 300),
                          // ignore: sort_child_properties_last
                          child: CircularImageWidget(
                              radius: 72,
                              borderredius: 70,
                              image: "assets/profile.png"),
                        ),
                      ),
                      const Text("@mrroccky"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Join Comunity 👇👇"),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //todo whatsaap button
                          InkWell(
                            onTap: (() => Link()
                                .launchURL(context: context, uri: whatsapp)),
                            child: const CircularImageWidget(
                                radius: 20,
                                borderredius: 18,
                                image: "assets/w.png"),
                          ),
                          //todo facebook button
                          InkWell(
                            onTap: (() => Link()
                                .launchURL(context: context, uri: facebook)),
                            child: const CircularImageWidget(
                                radius: 18,
                                borderredius: 16,
                                image: "assets/f.png"),
                          ),
                          //todo teligram button
                          InkWell(
                            onTap: (() => Link()
                                .launchURL(context: context, uri: teligram)),
                            child: const CircularImageWidget(
                                radius: 20,
                                borderredius: 18,
                                image: "assets/t.png"),
                          ),
                          //todo tweeter button
                          InkWell(
                            onTap: (() => Link()
                                .launchURL(context: context, uri: tweeter)),
                            child: const CircularImageWidget(
                                radius: 18,
                                borderredius: 16,
                                image: "assets/twe.png"),
                          ),
                          //todo instagram button
                          InkWell(
                            onTap: (() => Link()
                                .launchURL(context: context, uri: instagram)),
                            child: const CircularImageWidget(
                                radius: 18,
                                borderredius: 16,
                                image: "assets/i.png"),
                          ),
                          //todo linkedIn button
                          InkWell(
                            onTap: () => Link()
                                .launchURL(context: context, uri: linkedIn),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: CircularImageWidget(
                                  radius: 18,
                                  borderredius: 16,
                                  image: "assets/li.png"),
                            ),
                          ),
                          //todo youtube button
                          InkWell(
                            onTap: () => Link()
                                .launchURL(context: context, uri: youTube),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: CircularImageWidget(
                                  radius: 18,
                                  borderredius: 16,
                                  image: "assets/youtube.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                const UpcomingVideos(),
                const YtVideos(),
                const Footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularImageWidget extends StatelessWidget {
  const CircularImageWidget(
      {super.key,
      required this.radius,
      required this.borderredius,
      required this.image});
  final double radius, borderredius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: radius,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderredius),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
    ;
  }
}

class Link {
  Future<void> launchURL({required context, required uri}) async {
    final url = Uri.parse(uri);
    if (await launchUrl(url)) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  children: const [
                    Text("open on Anouther Tab"),
                  ],
                ),
              ),
            );
          }));
    } else {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  children: const [
                    Text("Oppps 😞 tray again after some time"),
                  ],
                ),
              ),
            );
          }));
    }
  }
}
