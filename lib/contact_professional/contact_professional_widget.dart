import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';

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

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
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
    var url = Uri.parse('tel:$number');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
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
      body: SafeArea(
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
                    options: ['Option 1'],
                    onChanged: (val) => setState(() => dropDownValue = val),
                    width: double.infinity,
                    height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
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
                        print('Button pressed ...');
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
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: ListTile(
                          title: Text(
                            'Name 1',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            'Phone Number 1',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: ListTile(
                          title: Text(
                            'Name 2',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            'Phone Number 2',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: ListTile(
                          title: Text(
                            'Name 3',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            'Phone Number 3',
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: ListTile(
                          title: Text(
                            'Name 4',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            'Phone Number 4',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
