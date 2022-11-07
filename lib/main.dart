import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  String gitHub = "https://github.com/mrroccky/";
  String whatsapp = "https://chat.whatsapp.com/IVlbM2X0Es3AXgWAzvvQuu/";
  String facebook = "https://www.facebook.com/oncrring";
  String teligram = "https://t.me/oncrring";
  String tweeter = "https://twitter.com/oncrring";
  String linkedIn = "https://www.instagram.com/oncrring_/";
  String instagram = "https://www.instagram.com/oncrring_/";
  String youTube = "https://www.youtube.com/channel/UC1XZEFGbkDOcPfFkHKi5wCQ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (() => _launchURL(context: context, uri: gitHub)),
              child: CircularImageWidget(
                  radius: 72, borderredius: 70, image: "assets/profile.png"),
            ),
            const Text("@mrroccky"),
            const SizedBox(
              height: 20,
            ),
            const Text("Join Oncrring Comunity 👇👇"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //todo whatsaap button
                InkWell(
                  onTap: (() => _launchURL(context: context, uri: whatsapp)),
                  child: CircularImageWidget(
                      radius: 20, borderredius: 18, image: "assets/w.png"),
                ),
                //todo facebook button
                InkWell(
                  onTap: (() => _launchURL(context: context, uri: facebook)),
                  child: CircularImageWidget(
                      radius: 18, borderredius: 16, image: "assets/f.png"),
                ),
                //todo teligram button
                InkWell(
                  onTap: (() => _launchURL(context: context, uri: teligram)),
                  child: CircularImageWidget(
                      radius: 20, borderredius: 18, image: "assets/t.png"),
                ),
                //todo tweeter button
                InkWell(
                  onTap: (() => _launchURL(context: context, uri: tweeter)),
                  child: CircularImageWidget(
                      radius: 18, borderredius: 16, image: "assets/twe.png"),
                ),
                //todo instagram button
                InkWell(
                  onTap: (() => _launchURL(context: context, uri: instagram)),
                  child: CircularImageWidget(
                      radius: 18, borderredius: 16, image: "assets/i.png"),
                ),
                //todo linkedIn button
                InkWell(
                  onTap: () => _launchURL(context: context, uri: linkedIn),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CircularImageWidget(
                        radius: 18, borderredius: 16, image: "assets/li.png"),
                  ),
                ),
                //todo youtube button
                InkWell(
                  onTap: () => _launchURL(context: context, uri: youTube),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CircularImageWidget(
                        radius: 18,
                        borderredius: 16,
                        image: "assets/youtube.png"),
                  ),
                ),
              ],
            ),
          ],
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

Future<void> _launchURL({required context, required uri}) async {
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
