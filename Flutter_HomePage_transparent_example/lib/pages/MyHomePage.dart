import 'package:Flutter_HomePage_transparent_example/pages/image_page.dart';
import 'package:Flutter_HomePage_transparent_example/pages/timecounter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color primarycolor1 = const Color.fromARGB(255, 0, 0, 0);
  Color primarycolor2 = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
        backgroundColor: Colors.white38,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              child: MasonryGridView.builder(
                itemCount: 7,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "lib/image/image-${index + 1}.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
