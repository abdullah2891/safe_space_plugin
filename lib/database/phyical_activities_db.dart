import 'package:firebase_database/firebase_database.dart';

class PhysicalAcvitityDbEntry {
  final String time;
  final String steps;

  PhysicalAcvitityDbEntry(this.time, this.steps);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString =
        "${timestamp.year}/${timestamp.month}/${timestamp.day}/${timestamp.hour}:${timestamp.minute}:${timestamp.second}";

    DatabaseReference dataRef =
        FirebaseDatabase.instance.ref("data/pedometerDb/$indexString");

    DatabaseReference indexRef = FirebaseDatabase.instance.ref(
        "index/pedometerDb/${timestamp.year}/${timestamp.month}/${timestamp.day}");

    dataRef.set({'time': time, 'steps': steps});
    indexRef
        .push()
        .set(timestamp.toIso8601String().replaceAll(RegExp(r'\..*'), ''));
  }

  List<PhysicalAcvitityDbEntry> getEntries() {
    List<PhysicalAcvitityDbEntry> entries = [];

    return entries;
  }

  static Future<PhysicalAcvitityDbEntry> getFromTimestamp(
      DateTime timestamp) async {
    final indexString =
        "${timestamp.year}/${timestamp.month}/${timestamp.day}/${timestamp.hour}:${timestamp.minute}:${timestamp.second}";

    DatabaseReference dataRef =
        FirebaseDatabase.instance.ref("data/pedometerDb/$indexString");

    final snapshot = await dataRef.get();

    return PhysicalAcvitityDbEntry((snapshot.value as Map)['time'] as String,
        (snapshot.value as Map)['steps'] as String);
  }
}
