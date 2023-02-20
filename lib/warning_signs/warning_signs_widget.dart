import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningSignsWidget extends StatefulWidget {
  const WarningSignsWidget({Key? key}) : super(key: key);

  @override
  _WarningSignsWidgetState createState() => _WarningSignsWidgetState();
}

class _WarningSignsWidgetState extends State<WarningSignsWidget> {
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
            'Page Title',
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.6, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Signs of Abuse',
                          options: FFButtonOptions(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            color: Color(0xFF006B6B),
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
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Abuse Quiz',
                        options: FFButtonOptions(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 20, 30, 20),
                          color: Color(0xFF006B6B),
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
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: FlutterFlowWebView(
                      url: 'https://www.lifewire.org/',
                      bypass: false,
                      height: 500,
                      verticalScroll: false,
                      horizontalScroll: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
