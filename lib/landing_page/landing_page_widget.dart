import 'package:safe_space_plugin/contact_professional/contact_professional_widget.dart';
import 'package:safe_space_plugin/emergency/emergency_widget.dart';
import 'package:safe_space_plugin/self_care/self_care_widget.dart';
import 'package:safe_space_plugin/warning_signs/warning_signs_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({Key? key}) : super(key: key);

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const EmergencyWidget()),
    //   );
    //   // context.pushNamed('Emergency');
    // });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
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
          'Safe Safe',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/safespace_banner.png',
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.15,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmergencyWidget()),
                          );
                        },
                        text: 'Emergency',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: Color(0xFFB70000),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ContactProfessionalWidget()),
                          );
                        },
                        text: 'Contact a Professional',
                        icon: Icon(
                          Icons.perm_contact_cal_outlined,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          color: Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Document Abuse',
                        icon: Icon(
                          Icons.menu_book_sharp,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          color: Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Safety Plan',
                        icon: Icon(
                          Icons.check,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          color: Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelfCareWidget()),
                          );
                        },
                        text: 'Self-Care',
                        icon: Icon(
                          Icons.favorite_sharp,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: Color(0x80006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WarningSignsWidget()),
                          );
                        },
                        text: 'Warning Signs',
                        icon: Icon(
                          Icons.dangerous,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
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
            ],
          ),
        ),
      ),
    );
  }
}
