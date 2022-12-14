import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

class ThumbnailWidget extends StatelessWidget {
  const ThumbnailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 8.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.network(
                "https://e1.pxfuel.com/desktop-wallpaper/794/237/desktop-wallpaper-friends-tv-show-on-dog-dog-thumbnail.jpg",
                height: 150,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 36.0,
              decoration: const BoxDecoration(
                color: Color(0xff2A2A2A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
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
