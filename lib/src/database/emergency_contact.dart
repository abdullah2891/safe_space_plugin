import 'package:flutter_contacts/flutter_contacts.dart';

import '../database/database_proxy.dart';

class EmergencyContact {
  final String name;
  final String phone;
  final String? email;

  EmergencyContact(this.name, this.phone, this.email);

  static Future<EmergencyContact?> saveContact(int c) async {
    late Contact? contact;
    try {
      contact = await FlutterContacts.openExternalPick();
      if (contact == null) {
        return null;
      }
    } catch (e) {
      return null;
    }

    EmergencyContact phoneContact = EmergencyContact(
      contact.displayName,
      contact.phones.isEmpty ? '' : contact.phones[0].number,
      contact.emails.isEmpty ? '' : contact.emails[0].address,
    );

    await DatabaseProxy('contactDb').put(c.toString(), {
      'name': phoneContact.name,
      'phone': phoneContact.phone,
      'email': phoneContact.email
    });
    return phoneContact;
  }

  static Future<void> resetContact(int c) async {
    await DatabaseProxy('contactDb').del(c.toString());
  }

  static Future<EmergencyContact> getContact(int c) async {
    final snapshot = await DatabaseProxy('contactDb').get(c.toString());

    if (snapshot == null) {
      return EmergencyContact('', '', '');
    }

    final map = snapshot as Map;

    return EmergencyContact(
        map['name'] as String, map['phone'] as String, map['email'] as String);
  }

  static Future<List<EmergencyContact?>> getContacts() async {
    List<EmergencyContact?> contacts = [];
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
