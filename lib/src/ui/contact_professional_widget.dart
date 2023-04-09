import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_drop_down.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../database/emergency_contact.dart';
import '../utility/phone.dart';

class ContactAProfessionalWidget extends StatefulWidget {
  const ContactAProfessionalWidget({Key? key}) : super(key: key);

  @override
  State<ContactAProfessionalWidget> createState() =>
      _ContactAProfessionalWidgetState();
}

class _ContactAProfessionalWidgetState
    extends State<ContactAProfessionalWidget> {
  String? dropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = TextEditingController();
  List<EmergencyContact?> contacts = [null, null, null, null];

  String? number;

  Map<String, String> hotlines = {
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
        padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
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
          onLongPress: () {
            if (contacts[i - 1] != null) {
              _call(contacts[i - 1]!.phone);
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

  void _sendMessage(String number, String message, BuildContext context) async {
    await Phone.text(
        message: message,
        recipients: [number],
        sendDirect: true,
        context: context);
  }

  void _call(String number) async {
    await Phone.call(number: number, callDirect: true, context: context);
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
            'Contact a Professional',
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
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Text(
                        'A list of national hotlines.',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
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
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                        hidesUnderline: true,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          minLines: 4,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Type a message here',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFDFBDDF),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              if (number == null) {
                                return;
                              }
                              _sendMessage(
                                  number!, textController.text, context);
                            },
                            text: 'Text',
                            icon: const Icon(
                              Icons.message,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              if (number == null) {
                                return;
                              }
                              _call(number!);
                            },
                            text: 'Call',
                            icon: const Icon(
                              Icons.phone,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
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
