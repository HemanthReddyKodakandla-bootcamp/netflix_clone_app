import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DownloadsView extends StatefulWidget {
  const DownloadsView({super.key});

  @override
  State<DownloadsView> createState() => _DownloadsViewState();
}

class _DownloadsViewState extends State<DownloadsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<Map<dynamic, dynamic>>("downloads").listenable(),
        builder: (BuildContext context, Box box, widget) {
          List<dynamic> localData = box.values.toList();
          if (localData.isEmpty) {
            return Container(
              color: Colors.red,
            );
          } else {
            return ListView.builder(
                itemCount: localData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                    child: Row(
                      children: [
                         ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.network(
                            localData[index]['thumbnail'],
                            height: 150,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(localData[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
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
                              ],
                            ),
                          ),
                        ),
                        const Icon(Icons.system_security_update_outlined,color: Colors.white,)
                      ],
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
