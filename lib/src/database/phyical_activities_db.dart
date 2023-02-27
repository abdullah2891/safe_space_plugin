import '../database/database_proxy.dart';

class PhysicalAcvitityDbEntry {
  final String time;
  final String steps;

  PhysicalAcvitityDbEntry(this.time, this.steps);

  void saveEntry() async {
    DatabaseProxy('pedometerDb')
        .saveIndexedData({'time': time, 'steps': steps});
  }

  List<PhysicalAcvitityDbEntry> getEntries() {
    List<PhysicalAcvitityDbEntry> entries = [];

    return entries;
  }

  static Future<PhysicalAcvitityDbEntry> getFromTimestamp(
      DateTime timestamp) async {
    final snapshot =
        await DatabaseProxy('pedometerDb').getFromTimestamp(timestamp);

    if (snapshot == null) {
      return PhysicalAcvitityDbEntry('', '');
    }

    final map = snapshot as Map;

    return PhysicalAcvitityDbEntry(
        map['time'] as String, map['steps'] as String);
  }
}
