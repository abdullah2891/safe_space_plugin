import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GratuityJournalWidget extends StatefulWidget {
  const GratuityJournalWidget({Key? key}) : super(key: key);

  @override
  _GratuityJournalWidgetState createState() => _GratuityJournalWidgetState();
}

class _GratuityJournalWidgetState extends State<GratuityJournalWidget> {
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
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
          'Gratitude Journal',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: FlutterFlowCalendar(
                          color: Color(0xFF006B6B),
                          weekFormat: false,
                          weekStartsMonday: false,
                          onChange: (DateTimeRange? newSelectedDate) {
                            setState(
                                () => calendarSelectedDay = newSelectedDate);
                          },
                          titleStyle: TextStyle(),
                          dayOfWeekStyle: TextStyle(),
                          dateStyle: TextStyle(),
                          selectedDateStyle: TextStyle(),
                          inactiveDateStyle: TextStyle(),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Text(
                            '\"Today, I am greatful for...\"',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          ),
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
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Text(
                            '\"Something I\'m looking forward to is...\"',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          ),
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
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Text(
                            '\"Something in my life I didn\'t have a year ago...\"',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          ),
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
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Text(
                            '\"A time when I made a mistake and learned from it...\"',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          ),
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Save Entry',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'View Entries',
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
