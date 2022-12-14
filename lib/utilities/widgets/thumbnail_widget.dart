import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'bottom_sheet.dart';
import 'dart:math';

class ThumbnailWidget extends StatefulWidget {
  const ThumbnailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ThumbnailWidget> createState() => _ThumbnailWidgetState();
}

class _ThumbnailWidgetState extends State<ThumbnailWidget> {

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 120,
        child: Column(
          children: [
            Stack(
              children:[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                  child: Image.network(
                    "https://e1.pxfuel.com/desktop-wallpaper/794/237/desktop-wallpaper-friends-tv-show-on-dog-dog-thumbnail.jpg",
                    height: 150,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ] ,
            ),
            LinearPercentIndicator(
              lineHeight: 2.6,
              percent: (random.nextInt(10)/10),
              padding: EdgeInsets.zero,
              progressColor: const Color(0xffE50914),
              backgroundColor: const Color(0xff989898),
              animation: true,

            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff2A2A2A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ShowBottomSheet.showSheet(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ShowBottomSheet.showSheet(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
