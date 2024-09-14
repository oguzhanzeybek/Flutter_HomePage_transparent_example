import 'dart:math';

import 'package:Flutter_HomePage_transparent_example/pages/MyHomePage.dart';
import 'package:Flutter_HomePage_transparent_example/pages/timecounter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  Color primarycolor1 = const Color.fromARGB(255, 255, 10, 161);
  Color primarycolor2 = const Color.fromARGB(255, 24, 39, 240);
  @override
  Widget build(BuildContext context) {
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
                    "flutter",
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
              title: const Text('homePage'),
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
              title: const Text('İmage page'),
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
              title: const Text('Time page'),
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
        title: "Flutter".text.xl4.bold.white.make().shimmer(
              primaryColor: primarycolor1,
              secondaryColor: primarycolor2,
            ),
        backgroundColor: Colors.transparent,
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
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: 330,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage("lib/image/image-1.jpg"),
                  ),
                  border: Border.symmetric(
                    horizontal: BorderSide(width: sqrt1_2),
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              Container(
                height: 330,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage("lib/image/image-2.jpg")),
                  border:
                      Border.symmetric(horizontal: BorderSide(width: sqrt1_2)),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              Container(
                height: 330,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage("lib/image/image-3.jpg")),
                  border:
                      Border.symmetric(horizontal: BorderSide(width: sqrt1_2)),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              Container(
                height: 330,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage("lib/image/image-4.jpg")),
                  border:
                      Border.symmetric(horizontal: BorderSide(width: sqrt1_2)),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              Container(
                height: 330,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage("lib/image/image-5.jpg")),
                  border:
                      Border.symmetric(horizontal: BorderSide(width: sqrt1_2)),
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
