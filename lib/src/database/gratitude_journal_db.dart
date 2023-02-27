import '../database/database_proxy.dart';

class GratitudeJournalEntry {
  final String grafulFor;
  final String lookingForwardTo;
  final String yearAgo;
  final String mistake;

  GratitudeJournalEntry(
      this.grafulFor, this.lookingForwardTo, this.yearAgo, this.mistake);

  void saveEntry() async {
    DatabaseProxy('gratitudeJournalDb').saveIndexedData({
      'gratefulFor': grafulFor,
      'lookingForwardTo': lookingForwardTo,
      'yearAgo': yearAgo,
      'mistake': mistake
    });
  }

  List<GratitudeJournalEntry> getEntries() {
    List<GratitudeJournalEntry> entries = [];

    return entries;
  }

  static Future<GratitudeJournalEntry> getFromTimestamp(
      DateTime timestamp) async {
    final snapshot =
        await DatabaseProxy('gratitudeJournalDb').getFromTimestamp(timestamp);

    if (snapshot == null) {
      return GratitudeJournalEntry('', '', '', '');
    }

    final map = snapshot as Map;

    return GratitudeJournalEntry(
        map['gratefulFor'] as String,
        map['lookingForwardTo'] as String,
        map['mistake'] as String,
        map['yearAgo'] as String);
  }
}
