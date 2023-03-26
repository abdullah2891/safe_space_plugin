import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../database/emergency_contact.dart';

class EmergencyContactsWidget extends StatefulWidget {
  const EmergencyContactsWidget({Key? key}) : super(key: key);

  @override
  State<EmergencyContactsWidget> createState() =>
      _EmergencyContactsWidgetState();
}

class _EmergencyContactsWidgetState extends State<EmergencyContactsWidget> {
  String? dropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = TextEditingController();
  List<EmergencyContact?> contacts = [null, null, null, null];

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
          })
        });
  }

  List<Widget> buildList() {
    List<Widget> childs = [];
    for (int i = 1; i <= 4; i++) {
      childs.add(Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: ListTile(
          title: Text(
            contacts[i - 1]?.name ?? 'Name $i',
            style: FlutterFlowTheme.of(context).title3,
          ),
          onTap: () async {
            EmergencyContact? c1 = await EmergencyContact.saveContact(i);
            if (c1 == null) {
              return;
            }
            setState(() {
              contacts[i - 1] = c1;
            });
          },
          onLongPress: () async {
            if (contacts[i - 1] != null) {
              await EmergencyContact.resetContact(i);
              setState(() {
                contacts[i - 1] = null;
              });
            }
          },
          subtitle: Text(
            contacts[i - 1]?.phone ?? 'Phone $i',
            style: FlutterFlowTheme.of(context).subtitle2,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF303030),
            size: 20,
          ),
          tileColor: const Color(0xFFF5F5F5),
          dense: false,
        ),
      ));
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF987E98),
        appBar: AppBar(
          backgroundColor: const Color(0xFF987E98),
          automaticallyImplyLeading: true,
          title: Text(
            'Emergency Contacts',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
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
          centerTitle: true,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                      child: Text(
                        'Emergency contact list. First one is Primary.',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: buildList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
