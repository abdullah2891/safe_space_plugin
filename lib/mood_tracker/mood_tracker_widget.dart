import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodTrackerWidget extends StatefulWidget {
  const MoodTrackerWidget({Key? key}) : super(key: key);

  @override
  _MoodTrackerWidgetState createState() => _MoodTrackerWidgetState();
}

class _MoodTrackerWidgetState extends State<MoodTrackerWidget> {
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
          'Mood Tracker',
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
                      FlutterFlowAudioPlayer(
                        audio: Audio.network(
                          'https://filesamples.com/samples/audio/mp3/sample3.mp3',
                          metas: Metas(
                            id: 'sample3.mp3-e01bi6lz',
                            title: 'Mood Music',
                          ),
                        ),
                        titleTextStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                        playbackDurationTextStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF9D9D9D),
                                  fontSize: 12,
                                ),
                        fillColor: Color(0xFFEEEEEE),
                        playbackButtonColor:
                            FlutterFlowTheme.of(context).primaryColor,
                        activeTrackColor: Color(0xFF57636C),
                        elevation: 4,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/happy.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Happy',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/sad.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Sad',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/angry.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Angry',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/nervous.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Nervous',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/annoyed.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Annoyed',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/goofy.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Goofy',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/surprised.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Surprised',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/disappointed.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Disappointed',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF987E98),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset(
                                  'assets/images/tired.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Tired',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
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
