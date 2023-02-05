import 'package:firebase_database/firebase_database.dart';

class GratitudeJournalDb {
  final String grafulFor;
  final String lookingForwardTo;
  final String yearAgo;
  final String mistake;

  GratitudeJournalDb(
      this.grafulFor, this.lookingForwardTo, this.yearAgo, this.mistake);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString =
        "${timestamp.day} ${timestamp.hour} ${timestamp.minute}";

    DatabaseReference ref =
        FirebaseDatabase.instance.ref("test/gratitudeJournal/$indexString");

    ref.set({
      'grafulFor': grafulFor,
      'lookingForwardTo': lookingForwardTo,
      'yearAgo': yearAgo,
      'mistake': mistake
    });
  }

  List<GratitudeJournalDb> getEntries() {
    List<GratitudeJournalDb> entries = [];

    return entries;
  }
}
