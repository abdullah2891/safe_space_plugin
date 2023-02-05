import 'package:firebase_database/firebase_database.dart';

class MoodTrackerDb {
  final String feeling;

  MoodTrackerDb(this.feeling);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString =
        "${timestamp.day} ${timestamp.hour} ${timestamp.minute}";

    DatabaseReference ref =
        FirebaseDatabase.instance.ref("test/moodTracker/$indexString");

    ref.set({'feeling': feeling});
  }

  List<MoodTrackerDb> getEntries() {
    List<MoodTrackerDb> entries = [];

    return entries;
  }
}
