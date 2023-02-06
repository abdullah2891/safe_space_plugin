import 'package:firebase_database/firebase_database.dart';

class ContactAProfessionalDbEntry {
  final String? contact1;
  final String? contact2;
  final String? contact3;
  final String? contact4;

  ContactAProfessionalDbEntry(
      this.contact1, this.contact2, this.contact3, this.contact4);

  void saveEntry() async {
    DatabaseReference dataRef =
        FirebaseDatabase.instance.ref("data/contactDb/");

    dataRef
        .set({'c1': contact1, 'c2': contact2, 'c3': contact3, 'c4': contact4});
  }

  List<ContactAProfessionalDbEntry> getEntries() {
    List<ContactAProfessionalDbEntry> entries = [];

    return entries;
  }

  static Future<ContactAProfessionalDbEntry> getEntry() async {
    DatabaseReference dataRef =
        FirebaseDatabase.instance.ref("data/contactDb/");

    final snapshot = await dataRef.get();

    return ContactAProfessionalDbEntry(
        (snapshot.value as Map)['c1'] as String,
        (snapshot.value as Map)['c2'] as String,
        (snapshot.value as Map)['c3'] as String,
        (snapshot.value as Map)['c4'] as String);
  }
}
