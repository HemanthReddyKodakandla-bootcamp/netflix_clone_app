import 'package:flutter/material.dart';

import '../utilities/images.dart';

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
        title: Image.asset(ImagePaths.iconImage,height: 52.0,width: 52.0,),
        actions:  [
          const Icon(Icons.search),
          Image.asset(ImagePaths.iconImage,height: 52.0,width: 52.0,),
        ],
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}