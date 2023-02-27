import '../database/database_proxy.dart';

class MoodTrackerDb {
  final String feeling;

  MoodTrackerDb(this.feeling);

  void saveEntry() async {
    DatabaseProxy('moodTracker').saveIndexedData({'feeling': feeling});
  }

  List<MoodTrackerDb> getEntries() {
    List<MoodTrackerDb> entries = [];

    return entries;
  }

  static Future<MoodTrackerDb> getFromTimestamp(DateTime timestamp) async {
    final snapshot =
        await DatabaseProxy('moodTracker').getFromTimestamp(timestamp);

    if (snapshot == null) {
      return MoodTrackerDb('');
    }

    return MoodTrackerDb((snapshot as Map)['feeling'] as String);
  }
}
