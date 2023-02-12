import 'package:firebase_database/firebase_database.dart';

import '../utility/auth.dart';

class MoodTrackerDb {
  final String feeling;

  MoodTrackerDb(this.feeling);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString =
        "${timestamp.day} ${timestamp.hour} ${timestamp.minute}";

    DatabaseReference ref = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/moodTracker/$indexString");

    ref.set({'feeling': feeling});
  }

  List<MoodTrackerDb> getEntries() {
    List<MoodTrackerDb> entries = [];

    return entries;
  }
}
