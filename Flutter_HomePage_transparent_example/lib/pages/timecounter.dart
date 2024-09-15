import 'package:Flutter_HomePage_transparent_example/pages/MyHomePage.dart';
import 'package:Flutter_HomePage_transparent_example/pages/image_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class Timecounter extends StatefulWidget {
  const Timecounter({super.key});

  @override
  State<Timecounter> createState() => _TimecounterState();
}

class _TimecounterState extends State<Timecounter> {
  Stream<DateTime> _timeStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Geçmiş bir tarih ve saat belirleyin
    DateTime pastDate = DateTime(2024, 8, 1, 21, 0, 0);
    // Şu anki tarih ve saat
    DateTime now = DateTime.now();
    // İki tarih arasındaki farkı hesaplayın
    now.difference(pastDate);
    Color primarycolor1 = const Color.fromARGB(255, 92, 43, 252);
    Color primarycolor2 = const Color.fromARGB(255, 3, 204, 235);
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
        title: "flutter".text.xl4.bold.white.make().shimmer(
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
            children: [
              SizedBox(
                height: 30,
              ),
              Text("timer", style: TextStyle(color: Colors.white))
                  .text
                  .xl4
                  .bold
                  .white
                  .center
                  .make(),
              Container(
                margin: EdgeInsets.only(
                  bottom: 100,
                  top: 100,
                  left: 50,
                  right: 50,
                ),
                color: Colors.transparent,
                child: Center(
                  child: StreamBuilder<DateTime>(
                    stream: _timeStream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      DateTime now = snapshot.data!;
                      Duration difference = now.difference(pastDate);

                      return Text(
                        '  ${difference.inDays} gün '
                        '             '
                        ' ${difference.inHours % 24} saat'
                        '               '
                        ' ${difference.inMinutes % 60} dakika'
                        '                '
                        ' ${difference.inSeconds % 60} saniye',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          wordSpacing: 5,
                          fontStyle: FontStyle.normal,
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
