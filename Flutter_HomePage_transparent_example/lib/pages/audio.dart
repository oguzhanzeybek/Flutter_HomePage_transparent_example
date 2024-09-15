import 'package:Flutter_HomePage_transparent_example/pages/MyHomePage.dart';
import 'package:Flutter_HomePage_transparent_example/pages/image_page.dart';
import 'package:Flutter_HomePage_transparent_example/pages/timecounter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart' as audioplayers;
import 'package:just_audio/just_audio.dart';

class Audiopage extends StatefulWidget {
  const Audiopage({super.key});

  @override
  State<Audiopage> createState() => _AudiopageState();
}

class _AudiopageState extends State<Audiopage> {
  final player = AudioPlayer();

  String formatduration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void handleseek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    player.setAsset("lib/audio/audio.mp3");
    player.positionStream.listen((p) {
      setState(() => position = p);
    });

    player.durationStream.listen((d) {
      setState(() => duration = d!);
    });
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          position = Duration.zero;
        });
        player.pause();
        player.seek(position);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primarycolor1 = const Color.fromARGB(255, 255, 6, 156);
    Color primarycolor2 = const Color.fromARGB(255, 132, 255, 136);
    return Scaffold(
      drawer: Drawer(
        elevation: 3,
        shape: Border.all(color: Colors.transparent),
        shadowColor: Vx.neutral100,
        backgroundColor: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "lib/image/image-1.jpg",
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "LooVE",
                    style: TextStyle(
                        color: Color.fromARGB(255, 212, 151, 217),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              textColor: Vx.sky100,
              leading: Icon(
                Icons.home,
                color: Vx.sky200,
              ),
              title: const Text('Anasayfa'),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                    title: '',
                  ),
                ),
              ),
            ),
            ListTile(
              textColor: Vx.sky100,
              leading: Icon(
                Icons.image,
                color: Vx.sky100,
              ),
              title: const Text('Resimlerimiz'),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ImagePage(),
                ),
              ),
            ),
            ListTile(
              textColor: Vx.sky100,
              leading: Icon(
                Icons.timer,
                color: Vx.sky100,
              ),
              title: const Text('ilişki zamanlayıcısı'),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Timecounter(),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: "LooVE".text.xl4.bold.white.make().shimmer(
              primaryColor: primarycolor1,
              secondaryColor: primarycolor2,
            ),
        backgroundColor: Colors.white38,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(
                  colors: [
                    primarycolor1,
                    const Color.fromARGB(255, 255, 255, 255),
                    primarycolor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
              .make(),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatduration(position),
                ),
                Slider(
                  min: 0.0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: handleseek,
                ),
                Text(
                  formatduration(duration),
                ),
                IconButton(
                  onPressed: handlePlayPause,
                  icon: Icon(player.playing ? Icons.pause : Icons.play_arrow),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
