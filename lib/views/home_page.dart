import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utilities/images.dart';
import '../utilities/widgets/thumbnail_widget.dart';
import 'downloads_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
   const DownloadsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    Box? box;
  @override
  void initState() {
    openBox();
    super.initState();
  }

  openBox() async {
    box = await Hive.openBox<Map<dynamic, dynamic>>("downloads");
  }

  closeBox() async {
    await box!.close();
  }

  @override
  void dispose() {
    closeBox();
    super.dispose();
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
              horizontal: 16.0,
            ),
            child: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff323232),
          unselectedItemColor: const Color(0xff989898),
          selectedIconTheme: const IconThemeData(color: Colors.white),
          selectedLabelStyle:
              const TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.downloading_rounded),
              label: "Downloads",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 32,
          onTap: _onItemTapped,
          elevation: 5),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
    final Stream<QuerySnapshot> _shows =
      FirebaseFirestore.instance.collection('shows').snapshots(includeMetadataChanges: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12.0
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _shows,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text("Loading"));
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      DocumentSnapshot doc = document;
                      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0,),
                            child: Text(
                              data['heading'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: GoogleFonts.montserrat().fontFamily),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(data['list'].length, (index) {
                                return ThumbnailWidget(show: data['list'][index]);
                              }),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
