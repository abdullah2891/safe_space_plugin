import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:safe_space_plugin/database/contact_a_professional_db.dart';

class ContactAProfessionalWidget extends StatefulWidget {
  const ContactAProfessionalWidget({Key? key}) : super(key: key);

  @override
  _ContactAProfessionalWidgetState createState() =>
      _ContactAProfessionalWidgetState();
}

class _ContactAProfessionalWidgetState
    extends State<ContactAProfessionalWidget> {
  String? dropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = TextEditingController();
  List<Contact?> contacts = [null, null, null, null];

  String number = '1-800-787-3224';

  Map<String, String> hotlines = {
    'Test': '1-425-305-7338',
    'The National Domestic Violence Hotline': '1-800-787-3224',
    'The National Dating Abuse Helpline': '1-866-331-9474',
    'DoD Safe Helpline': '1-877-995-5247',
    'LGBT National Help Center': '1-888-843-4564',
    'National Runaway Safeline': '1-773-289-1727',
    'National Sexual Assault Hotline': '1-800-656-4673',
    'The Trevor Project': '1-212-695-8650',
    'VictimConnect': '1-855-484-2846',
    'National Teen Dating Abuse Helpline': '1-866-331-9474'
  };

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
          })
        });
  }

  List<Widget> buildList() {
    List<Widget> childs = [];
    for (int i = 1; i <= 4; i++) {
      childs.add(Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: ListTile(
          title: Text(
            contacts[i - 1]?.name ?? 'Name $i',
            style: FlutterFlowTheme.of(context).title3,
          ),
          onTap: () async {
            Contact? c1 = await Contact.saveContact(i);
            if (c1 == null) {
              return;
            }
            setState(() {
              contacts[i - 1] = c1;
            });
          },
          onLongPress: () {
            if (contacts[i - 1] != null) {
              _call(contacts[i - 1]!.phone);
            }
          },
          subtitle: Text(
            contacts[i - 1]?.phone ?? 'Phone $i',
            style: FlutterFlowTheme.of(context).subtitle2,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF303030),
            size: 20,
          ),
          tileColor: Color(0xFFF5F5F5),
          dense: false,
        ),
      ));
    }
    return childs;
  }

  void _sendMessage(String number, String message) async {
    if (!await canSendSMS()) {
      return;
    }
    // List of phone numbers to send the message to
    List<String> recipients = [number];

    sendSMS(message: message, recipients: recipients, sendDirect: true);
  }

  void _call(String number) async {
    try {
      FlutterPhoneDirectCaller.callNumber(number);
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF987E98),
        appBar: AppBar(
          backgroundColor: Color(0xFF987E98),
          automaticallyImplyLeading: true,
          title: Text(
            'Contact a Professional',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Text(
                        'The dropdown menu provides a list of national hotlines you can text or call for information.',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: FlutterFlowDropDown<String>(
                        options: hotlines.keys.map((item) => item).toList(),
                        onChanged: (val) =>
                            setState(() => number = val as String),
                        width: double.infinity,
                        height: 50,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                        hintText: 'Please select...',
                        fillColor: Colors.white,
                        elevation: 2,
                        borderColor: Colors.transparent,
                        borderWidth: 0,
                        borderRadius: 0,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: TextFormField(
                          controller: textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Type a message here',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFDFBDDF),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () {
                            _sendMessage(number, textController.text);
                          },
                          text: 'Text',
                          icon: Icon(
                            Icons.message,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            _call(number);
                          },
                          text: 'Call',
                          icon: Icon(
                            Icons.phone,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Text(
                        'Select a list of contacts that you can trust in case of an emergency. These contacts will recieve your location if you chose to send it to them.',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
