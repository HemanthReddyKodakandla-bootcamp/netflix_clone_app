import 'package:hive_flutter/hive_flutter.dart';

class DownloadsLocalDb {
  Future saveDownloadsData(Map<dynamic, dynamic> data) async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>("downloads");
     await box.put(data['title'], data);
  }
}
