import 'package:safe_space_plugin/five_min_walk/five_min_walk_widget.dart';
import 'package:safe_space_plugin/gratitude_journal/gratitude_journal_widget.dart';
import 'package:safe_space_plugin/mood_tracker/mood_tracker_widget.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelfCareWidget extends StatefulWidget {
  const SelfCareWidget({Key? key}) : super(key: key);

  @override
  _SelfCareWidgetState createState() => _SelfCareWidgetState();
}

class _SelfCareWidgetState extends State<SelfCareWidget> {
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF987E98),
        automaticallyImplyLeading: true,
        title: Text(
          'SelfCare',
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
                Container(
                  width: 500,
                  height: 1000,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/background.PNG',
                      ).image,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.16, 0.21),
                        child: Image.asset(
                          'assets/images/gradimage.PNG',
                          width: 349,
                          height: 195,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.03, -0.27),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const FiveMinWalkWidget()),
                            );
                          },
                          text: 'Physical Activity',
                          icon: Icon(
                            Icons.directions_walk_outlined,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 349,
                            height: 112,
                            color: Color(0xFFF587FD),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF840084),
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
                      Align(
                        alignment: AlignmentDirectional(0.03, -0.88),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const GratitudeJournalWidget()),
                            );
                          },
                          text: 'Gratitude Journal',
                          icon: Icon(
                            Icons.menu_book_sharp,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 349,
                            height: 112,
                            color: Color(0xFFF587FD),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF840084),
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
                      Align(
                        alignment: AlignmentDirectional(0.03, -0.57),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MoodTrackerWidget()),
                            );
                          },
                          text: 'Mood Tracker',
                          icon: Icon(
                            Icons.emoji_emotions_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 349,
                            height: 112,
                            color: Color(0xFFF587FD),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF840084),
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
