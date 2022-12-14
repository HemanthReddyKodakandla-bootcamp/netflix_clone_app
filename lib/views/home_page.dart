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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          ImagePaths.iconImage,
          height: 52.0,
          width: 52.0,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ),
            child: Image.asset(
              ImagePaths.iconImage,
              height: 52.0,
              width: 52.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "US TV Shows",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
            ],
          ),
        ),
      ),
    );
  }
}
