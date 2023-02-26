import 'package:firebase_database/firebase_database.dart';

import '../utility/auth.dart';

class MoodTrackerDb {
  final String feeling;

  MoodTrackerDb(this.feeling);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString = "${timestamp.year}/${timestamp.month}/${timestamp.day}";

    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/moodTracker/$indexString");

    DatabaseReference indexRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/index/moodTracker/$indexString");

    dataRef.set({'feeling': feeling});

    indexRef
        .push()
        .set(timestamp.toIso8601String().replaceAll(RegExp(r'\..*'), ''));
  }

  List<MoodTrackerDb> getEntries() {
    List<MoodTrackerDb> entries = [];

    return entries;
  }

  static Future<MoodTrackerDb> getFromTimestamp(DateTime timestamp) async {
    final indexString = "${timestamp.year}/${timestamp.month}/${timestamp.day}";

    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/moodTracker/$indexString");

    final snapshot = await dataRef.get();

    return MoodTrackerDb((snapshot.value as Map)['feeling'] as String);
  }
}
