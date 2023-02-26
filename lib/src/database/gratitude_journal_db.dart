import 'package:firebase_database/firebase_database.dart';

import '../utility/auth.dart';

class GratitudeJournalEntry {
  final String grafulFor;
  final String lookingForwardTo;
  final String yearAgo;
  final String mistake;

  GratitudeJournalEntry(
      this.grafulFor, this.lookingForwardTo, this.yearAgo, this.mistake);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString =
        "${timestamp.year}/${timestamp.month}/${timestamp.day}/${timestamp.hour}:${timestamp.minute}:${timestamp.second}";

    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/gratitudeJournalDb/$indexString");

    DatabaseReference indexRef = FirebaseDatabase.instance.ref(
        "${Auth().currentUser!.uid}/index/gratitudeJournalDb/${timestamp.year}/${timestamp.month}/${timestamp.day}");

    dataRef.set({
      'grafulFor': grafulFor,
      'lookingForwardTo': lookingForwardTo,
      'yearAgo': yearAgo,
      'mistake': mistake
    });
    indexRef
        .push()
        .set(timestamp.toIso8601String().replaceAll(RegExp(r'\..*'), ''));
  }

  List<GratitudeJournalEntry> getEntries() {
    List<GratitudeJournalEntry> entries = [];

    return entries;
  }

  static Future<GratitudeJournalEntry> getFromTimestamp(
      DateTime timestamp) async {
    final indexString =
        "${timestamp.year}/${timestamp.month}/${timestamp.day}/${timestamp.hour}:${timestamp.minute}:${timestamp.second}";

    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/gratitudeJournalDb/$indexString");

    final snapshot = await dataRef.get();

    return GratitudeJournalEntry(
        (snapshot.value as Map)['gratefulFor'] as String,
        (snapshot.value as Map)['lookingForwardTo'] as String,
        (snapshot.value as Map)['mistake'] as String,
        (snapshot.value as Map)['yearAgo'] as String);
  }
}
