import 'package:firebase_database/firebase_database.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

import '../utility/auth.dart';

class Contact {
  final String name;
  final String phone;
  final String? email;

  Contact(this.name, this.phone, this.email);

  static Future<Contact?> saveContact(int c) async {
    late FullContact contact;
    try {
      contact =
          await FlutterContactPicker.pickFullContact(askForPermission: true);
    } catch (e) {
      return null;
    }

    Contact phoneContact = Contact(
        contact.name?.firstName ?? '',
        contact.phones.isEmpty ? '' : contact.phones[0].number ?? '',
        contact.emails.isEmpty ? '' : contact.emails[0].email ?? '');

    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/contactDb/$c");

    dataRef.set({
      'name': phoneContact.name,
      'phone': phoneContact.phone,
      'email': phoneContact.email
    });
    return phoneContact;
  }

  static Future<Contact> getContact(int c) async {
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/contactDb/$c");

    final snapshot = await dataRef.get();

    return Contact(
        (snapshot.value as Map)['name'] as String,
        (snapshot.value as Map)['phone'] as String,
        (snapshot.value as Map)['email'] as String);
  }

  static Future<List<Contact?>> getContacts() async {
    List<Contact?> contacts = [];
    for (int i = 1; i <= 4; i++) {
      try {
        contacts.add(await getContact(i));
      } catch (e) {
        contacts.add(null);
      }
    }
    return contacts;
  }
}
