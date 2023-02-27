import 'package:fluttercontactpicker/fluttercontactpicker.dart';

import '../database/database_proxy.dart';

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

    DatabaseProxy('contactDb').put(c.toString(), {
      'name': phoneContact.name,
      'phone': phoneContact.phone,
      'email': phoneContact.email
    });
    return phoneContact;
  }

  static Future<Contact> getContact(int c) async {
    final snapshot = await DatabaseProxy('contactDb').get(c.toString());

    if (snapshot == null) {
      return Contact('', '', '');
    }

    final map = snapshot as Map;

    return Contact(
        map['name'] as String, map['phone'] as String, map['email'] as String);
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
