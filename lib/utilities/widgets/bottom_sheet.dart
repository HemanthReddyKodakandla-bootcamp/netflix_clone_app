import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowBottomSheet {
  static showSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xff2A2A2A),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImageWidget(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Demon Slayer: Kimetsu no Yaiba",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white30),
                                  padding: const EdgeInsets.all(4.0),
                                  child: const Icon(
                                    Icons.close_rounded,
                                    size: 26.0,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                          ),
                          child: Text(
                            "2021   U/A  16+   3 Seasons",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                            ),
                          ),
                        ),
                        Text(
                          "After kjfd jk k jk kjkj kjk k kjk hk hk hkh klh klh klhklh lkhlk hlk hl kh lh lkjh lkjh ",
                          maxLines: 4,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                            )
                        )
                      ],
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButtonWidget(
                      icon: Icons.play_arrow_rounded,
                      onPressed: () {},
                      text: "Play",
                      backgroundColor: Colors.white,
                      iconColor: Colors.black,
                    ),
                    IconButtonWidget(
                      icon: Icons.download_outlined,
                      onPressed: () {},
                      text: "Download",
                      backgroundColor: Colors.white30,
                      iconColor: Colors.white,
                    ),
                    IconButtonWidget(
                      icon: Icons.done_rounded,
                      onPressed: () {},
                      text: "My List",
                      backgroundColor: Colors.white30,
                      iconColor: Colors.white,
                    ),
                    IconButtonWidget(
                      icon: Icons.share_outlined,
                      onPressed: () {},
                      text: "Share",
                      backgroundColor: Colors.white30,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                endIndent: 0.0,
                indent: 0.0,
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                      ),
                      child: Text(
                        "Episodes & Info",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        elevation: 8.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                "https://e1.pxfuel.com/desktop-wallpaper/794/237/desktop-wallpaper-friends-tv-show-on-dog-dog-thumbnail.jpg",
                height: 150,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class IconButtonWidget extends StatelessWidget {
  void Function()? onPressed;
  IconData icon;
  Color iconColor;
  Color backgroundColor;
  String text;
  IconButtonWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
            ),
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              icon,
              size: 26.0,
              color: iconColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.white54,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
          ),
        )
      ],
    );
  }
}
