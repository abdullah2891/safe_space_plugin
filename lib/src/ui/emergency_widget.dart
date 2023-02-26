import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../database/contact_a_professional_db.dart';

class EmergencyWidget extends StatefulWidget {
  const EmergencyWidget({Key? key}) : super(key: key);

  @override
  EmergencyWidgetState createState() => EmergencyWidgetState();
}

class EmergencyWidgetState extends State<EmergencyWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Contact?> contacts = [null, null, null, null];
  bool contactsThere = false;

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Contact.getContacts().then((value) => {
          setState(() {
            contacts = value;
            contactsThere = (value[0] == null);
          })
        });
  }

  void _sendLocation() async {
    if (!await canSendSMS()) {
      return;
    }
    await Geolocator.requestPermission();
    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Create a message with the location
    String message = "My current location is: "
        "https://www.google.com/maps?q=${position.latitude},${position.longitude}";

    // List of phone numbers to send the message to
    List<String> recipients = contacts
        .map((i) => i?.phone ?? '')
        .where((element) => element.isNotEmpty)
        .toList();

    sendSMS(message: message, recipients: recipients, sendDirect: true);
  }

  void _callEmergency() async {
    var url = Uri.parse('tel:911');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  _dialAFriend() async {
    String number = contacts[0]!.phone; //set the number here
    FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text(
          'Emergency',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: const Color(0xFFFF0404),
                fontSize: 22,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: FFButtonWidget(
                  onPressed: () {
                    _callEmergency();
                  },
                  text: 'Call 911',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: FFButtonWidget(
                  onPressed: () {
                    _sendLocation();
                  },
                  text: 'Send Location to Contacts',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: FFButtonWidget(
                  onPressed: () {
                    _dialAFriend();
                  },
                  text: 'Phone a Friend',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
