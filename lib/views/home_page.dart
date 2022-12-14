import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/images.dart';
import '../utilities/widgets/thumbnail_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text('Downloads', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          ImagePaths.iconImage,
          height: 52.0,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff323232),
          unselectedItemColor: const Color(0xff989898),
          selectedIconTheme: const IconThemeData(color: Colors.white),
          selectedLabelStyle: const TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w600),

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Downloads",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
      body:  _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 8.0),
              child: Text(
                "US TV Shows",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: const [
                    ThumbnailWidget(),
                    ThumbnailWidget(),
                    ThumbnailWidget(),
                    ThumbnailWidget(),
                    ThumbnailWidget(),
                    ThumbnailWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

