import 'dart:io';

import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_audio_player.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../database/mood_tracker_db.dart';
import 'view_entries.dart';

class MoodTrackerWidget extends AbstractTimestampedWidget {
  final DateTime? loadForTimstamp;
  const MoodTrackerWidget({Key? key, this.loadForTimstamp}) : super(key: key);

  @override
  State<MoodTrackerWidget> createState() => _MoodTrackerWidgetState();

  @override
  Widget clone(DateTime timestamp) =>
      MoodTrackerWidget(loadForTimstamp: timestamp);
}

class _MoodTrackerWidgetState extends State<MoodTrackerWidget> {
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String feeling = 'Happy';

  String audioFilePath = 'packages/safe_space_plugin/assets/audios/happy.m4a';
  bool _isReadOnly = false;
  @override
  void initState() {
    super.initState();
    if (widget.loadForTimstamp != null) {
      MoodTrackerDb.getFromTimestamp(widget.loadForTimstamp!).then((entry) {
        feeling = entry.feeling;
        _isReadOnly = true;
      });
    }
  }

  Future<void> saveFile(String sourcePath, String destinationPath) async {
    final file = File(sourcePath);
    final bytes = await file.readAsBytes();
    final newFile = File(destinationPath);
    await newFile.create(recursive: true);
    await newFile.writeAsBytes(bytes);
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  void _save() {
    final entry = MoodTrackerDb(feeling);
    entry.saveEntry();
  }

  void _change(String foo) async {
    setState(() {
      feeling = foo;
      audioFilePath = 'packages/safe_space_plugin/assets/audios/$feeling.m4a';
    });
  }

  List<Widget> buildList(List<String> foo) {
    List<Widget> childs = [];
    for (int i = 0; i <= 2; i++) {
      Widget w = GestureDetector(
          onTap: () {
            _change(foo[i]);
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: const Color(0xFF987E98),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'packages/safe_space_plugin/assets/images/${foo[i]}.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(
                  foo[i],
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ],
            ),
          ));
      childs.add(w);
    }
    return childs;
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
          'Mood Tracker',
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
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: FlutterFlowAudioPlayer(
                          audio: Audio(
                            audioFilePath,
                            metas: Metas(
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
                                    color: const Color(0xFF9D9D9D),
                                    fontSize: 12,
                                  ),
                          fillColor: const Color(0xFFEEEEEE),
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          activeTrackColor: const Color(0xFF57636C),
                          elevation: 4,
                        ),
                      ),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildList(['happy', 'sad', 'angry'])),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildList(['nervous', 'annoyed', 'goofy'])),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildList(
                              ['surprised', 'disappointed', 'tired'])),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 5, 5, 5),
                              child: FFButtonWidget(
                                onPressed: () {
                                  if (!_isReadOnly) _save();
                                },
                                text: 'Save',
                                icon: const Icon(
                                  Icons.save,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: const Color(0xFF0B6B65),
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
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 5, 5, 5),
                              child: FFButtonWidget(
                                onPressed: () {
                                  if (!_isReadOnly) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ViewEntriesWidget(
                                                table: 'moodTracker',
                                                parent: widget,
                                              )),
                                    );
                                  }
                                },
                                text: 'View',
                                icon: const Icon(
                                  Icons.list,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: const Color(0xFF0B6B65),
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
                            ),
                          ],
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
