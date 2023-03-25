import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../utility/auth.dart';
import 'contact_professional_widget.dart';
import 'document_abuse_widget.dart';
import 'emergency_contacts_widget.dart';
import 'emergency_widget.dart';
import 'resources_widget.dart';
import 'safety_plan/main/main_widget.dart';
import 'self_care_widget.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({Key? key}) : super(key: key);

  @override
  State<LandingPageWidget> createState() => _LandingPageWidgetState();
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
      backgroundColor: const Color(0xFF987E98),
      appBar: AppBar(
        backgroundColor: const Color(0xFF987E98),
        automaticallyImplyLeading: true,
        title: Text(
          'Safe Safe',
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
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'packages/safe_space_plugin/assets/images/safespace_banner.jpg',
                          width: 100,
                          height: MediaQuery.of(context).size.height * 0.25,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
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
                          color: const Color(0xFFB70000),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EmergencyContactsWidget()),
                          );
                        },
                        text: 'Emergency Contacts',
                        icon: const Icon(
                          Icons.perm_contact_cal_outlined,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 50,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          color: const Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ContactAProfessionalWidget()),
                          );
                        },
                        text: 'Contact a Professional',
                        icon: const Icon(
                          Icons.message,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 50,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          color: const Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DocumentAbuseWidget()),
                          );
                        },
                        text: 'Document Abuse',
                        icon: const Icon(
                          Icons.menu_book_sharp,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 50,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          color: const Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainWidget()),
                          );
                        },
                        text: 'Safety Plan',
                        icon: const Icon(
                          Icons.check,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          height: 50,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          color: const Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelfCareWidget()),
                          );
                        },
                        text: 'Self-Care',
                        icon: const Icon(
                          Icons.favorite_sharp,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: const Color(0x80006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResourcesWidget()),
                          );
                        },
                        text: 'Warning Signs',
                        icon: const Icon(
                          Icons.warning_rounded,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: const Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                      child: FFButtonWidget(
                        onPressed: () {
                          Auth().signOut();
                          Navigator.pop(context);
                        },
                        text: 'Logout',
                        icon: const Icon(
                          Icons.logout,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: const Color(0x7F006B6B),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
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
            ],
          ),
        ),
      ),
    );
  }
}
