import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:safe_space_plugin/database/mood_tracker_db.dart';
import '../views/view_entries.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MoodTrackerWidget extends AbstractTimestampedWidget {
  final DateTime? loadForTimstamp;
  const MoodTrackerWidget({Key? key, this.loadForTimstamp}) : super(key: key);

  @override
  _MoodTrackerWidgetState createState() => _MoodTrackerWidgetState();

  @override
  Widget clone(DateTime timestamp) =>
      MoodTrackerWidget(loadForTimstamp: timestamp);
}

class _MoodTrackerWidgetState extends State<MoodTrackerWidget> {
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String feeling = 'Happy';

  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  String audioFilePath = 'assets/audios/Happy.m4a';
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
    String path = await _localPath();
    setState(() {
      feeling = foo;
      audioFilePath = '$path/audios/$feeling.m4a';
    });
  }

  List<Widget> buildList(List<String> foo) {
    List<Widget> childs = [];
    for (int i = 0; i <= 2; i++) {
      Future<String> path = _localPath();

      Widget w = GestureDetector(
          onTap: () {
            _change(foo[i]);
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFF987E98),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/images/${foo[i]}.png',
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
                                    color: Color(0xFF9D9D9D),
                                    fontSize: 12,
                                  ),
                          fillColor: Color(0xFFEEEEEE),
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          activeTrackColor: Color(0xFF57636C),
                          elevation: 4,
                        ),
                      ),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildList(['Happy', 'Sad', 'Angry'])),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildList(['Nervous', 'Annoyed', 'Goofy'])),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildList(
                              ['Surprised', 'Disappointed', 'Tired'])),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: FFButtonWidget(
                                onPressed: () {
                                  if (!_isReadOnly) _save();
                                },
                                text: 'Save',
                                icon: Icon(
                                  Icons.save,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFF0B6B65),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
                                icon: Icon(
                                  Icons.list,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: Color(0xFF0B6B65),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
