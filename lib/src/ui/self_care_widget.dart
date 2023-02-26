import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'five_min_walk_widget.dart';
import 'gratitude_journal_widget.dart';
import 'mood_tracker_widget.dart';

class SelfCareWidget extends StatefulWidget {
  const SelfCareWidget({Key? key}) : super(key: key);

  @override
  State<SelfCareWidget> createState() => _SelfCareWidgetState();
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
        backgroundColor: const Color(0xFF987E98),
        automaticallyImplyLeading: true,
        title: Text(
          'SelfCare',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: const [],
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
                        'packages/safe_space_plugin/assets/images/background.png',
                      ).image,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.16, 0.21),
                        child: Image.asset(
                          'packages/safe_space_plugin/assets/images/gradimage.png',
                          width: 349,
                          height: 195,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.03, -0.27),
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
                          icon: const Icon(
                            Icons.directions_walk_outlined,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 349,
                            height: 112,
                            color: const Color(0xFFF587FD),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Inter',
                                      color: const Color(0xFF840084),
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
                      Align(
                        alignment: const AlignmentDirectional(0.03, -0.88),
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
                          icon: const Icon(
                            Icons.menu_book_sharp,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 349,
                            height: 112,
                            color: const Color(0xFFF587FD),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Inter',
                                      color: const Color(0xFF840084),
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
                      Align(
                        alignment: const AlignmentDirectional(0.03, -0.57),
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
                          icon: const Icon(
                            Icons.emoji_emotions_rounded,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 349,
                            height: 112,
                            color: const Color(0xFFF587FD),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Inter',
                                      color: const Color(0xFF840084),
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
