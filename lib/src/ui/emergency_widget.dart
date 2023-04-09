import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../database/emergency_contact.dart';
import '../utility/phone.dart';
import 'emergency_contacts_widget.dart';

class EmergencyWidget extends StatefulWidget {
  const EmergencyWidget({Key? key}) : super(key: key);

  @override
  EmergencyWidgetState createState() => EmergencyWidgetState();
}

class EmergencyWidgetState extends State<EmergencyWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<EmergencyContact?> contacts = [null, null, null, null];
  bool contactsThere = false;

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    EmergencyContact.getContacts().then((value) => {
          setState(() {
            contacts = value;
            contactsThere = (value[0] == null);
          })
        });
  }

  void _sendLocation(BuildContext context) async {
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

    // ignore: use_build_context_synchronously
    await Phone.text(
        message: message,
        recipients: recipients,
        sendDirect: true,
        context: context);
  }

  void _callEmergency(BuildContext context) async {
    Phone.call(number: '911', callDirect: false, context: context);
  }

  _callPrimary(BuildContext context) async {
    String number = contacts[0]!.phone; //set the number here
    Phone.call(number: number, callDirect: true, context: context);
  }

  List<Widget> _buildContactList(BuildContext context) {
    String number = contacts[0]?.phone ?? ''; //set the number here

    if (number == '') {
      return [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
          child: FFButtonWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EmergencyContactsWidget()),
              ).then((value) => {
                    EmergencyContact.getContacts().then((value) => {
                          setState(() {
                            contacts = value;
                            contactsThere = (value[0] == null);
                          })
                        })
                  });
            },
            text: 'Update Emergency Contacts',
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
      ];
    } else {
      return [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
          child: FFButtonWidget(
            onPressed: () {
              _sendLocation(context);
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
              _callPrimary(context);
            },
            text: 'Phone Primary Contact',
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
      ];
    }
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ],
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
                    _callEmergency(context);
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
              ..._buildContactList(context)
            ],
          ),
        ),
      ),
    );
  }
}
