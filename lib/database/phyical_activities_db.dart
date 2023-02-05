import 'package:firebase_database/firebase_database.dart';

class PhyicalActivitiesDb {
  final int time;
  final int steps;
  final int distance;

  PhyicalActivitiesDb(this.time, this.steps, this.distance);

  void saveEntry() async {
    final timestamp = DateTime.now();
    final indexString =
        "${timestamp.day} ${timestamp.hour} ${timestamp.minute}";

    DatabaseReference ref =
        FirebaseDatabase.instance.ref("test/phyicalActivities/$indexString");

    ref.set({'time': time, 'steps': steps, 'distance': distance});
  }

  List<PhyicalActivitiesDb> getEntries() {
    List<PhyicalActivitiesDb> entries = [];

    return entries;
  }
}
