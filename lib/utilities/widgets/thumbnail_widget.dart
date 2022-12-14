import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

class ThumbnailWidget extends StatelessWidget {
  final Map<dynamic, dynamic> show;
  const ThumbnailWidget({
    required this.show,
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
                show['thumbnail'],
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
                      ShowBottomSheet.showSheet(context,show);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      ShowBottomSheet.showSheet(context,show);
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
