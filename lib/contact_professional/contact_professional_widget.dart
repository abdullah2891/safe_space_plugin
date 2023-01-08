import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactProfessionalWidget extends StatefulWidget {
  const ContactProfessionalWidget({Key? key}) : super(key: key);

  @override
  _ContactProfessionalWidgetState createState() =>
      _ContactProfessionalWidgetState();
}

class _ContactProfessionalWidgetState extends State<ContactProfessionalWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          'Contact Professional',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'You are contacting: ____',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Container(
                  width: 351.9,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE0FF),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: Text(
                    'Enter message here...',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
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
