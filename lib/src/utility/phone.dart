import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';

import 'config.dart';

class Phone {
  static Future<void> call(
      {required String number,
      required bool callDirect,
      required BuildContext context}) async {
    try {
      if (Config().isDemo) {
        await _showMyDialog([
          "Calling number: $number",
        ], context);
        return;
      }
      if (callDirect) {
        FlutterPhoneDirectCaller.callNumber(number);
      } else {
        var url = Uri.parse('tel:$number');
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      }
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  static Future<void> text(
      {required String message,
      required List<String> recipients,
      required bool sendDirect,
      required BuildContext context}) async {
    if (Config().isDemo) {
      await _showMyDialog([
        "Sending message: $message",
        "To: $recipients",
      ], context);
      return;
    }
    try {
      if (!await canSendSMS()) {
        return;
      }

      sendSMS(message: message, recipients: recipients, sendDirect: sendDirect);
    } catch (error) {
      throw ("Cannot text");
    }
  }

  static Future<void> _showMyDialog(
      List<String> texts, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Demo Mode'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var text in texts) Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
