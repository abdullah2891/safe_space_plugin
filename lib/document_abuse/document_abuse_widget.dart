import 'dart:io';
import 'dart:typed_data';
import 'package:safe_space_plugin/database/document_abuse_db.dart';

import '../audio/audio_recorder.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import '../views/view_entries.dart';

class DocumentAbuseWidget extends AbstractTimestampedWidget {
  final DateTime? loadForTimstamp;
  const DocumentAbuseWidget({Key? key, this.loadForTimstamp}) : super(key: key);

  @override
  _DocumentAbuseWidgetState createState() => _DocumentAbuseWidgetState();

  @override
  Widget clone(DateTime timestamp) =>
      DocumentAbuseWidget(loadForTimstamp: timestamp);
}

class _DocumentAbuseWidgetState extends State<DocumentAbuseWidget> {
  final TextEditingController textController = TextEditingController();
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  String? audioFilePath;
  String? imageFilePath;
  bool _isReadOnly = false;

  void _saveAndClear() {
    Uint8List? audioData;
    Uint8List? imageData;
    if (audioFilePath != null) {
      audioData = File(audioFilePath!).readAsBytesSync();
      File(audioFilePath!).deleteSync();
    }
    if (imageFilePath != null) {
      imageData = File(imageFilePath!).readAsBytesSync();
      File(imageFilePath!).deleteSync();
    }
    final text = textController.text;
    setState(() {
      textController.clear();
      audioFilePath = null;
      imageFilePath = null;
    });
    final entry = DocumentAbuseEntry(text, imageData, audioData);
    entry.saveEntry();
  }

  @override
  void initState() {
    super.initState();
    if (widget.loadForTimstamp != null) {
      DocumentAbuseEntry.getFromTimestamp(widget.loadForTimstamp!)
          .then((entry) {
        textController.text = entry.text;
        _isReadOnly = true;
        getApplicationDocumentsDirectory().then((folder) {
          if (entry.audio != null) {
            File("${folder.path}/audio.m4a").writeAsBytesSync(entry.audio!);
          }
          if (entry.image != null) {
            File("${folder.path}/image.jpg").writeAsBytesSync(entry.image!);
          }
          setState(() {
            if (entry.audio != null) {
              audioFilePath = "${folder.path}/audio.m4a";
            }
            if (entry.image != null) {
              imageFilePath = "${folder.path}/image.jpg";
            }
          });
        });
      });
    }
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();

    if (audioFilePath != null) {
      File(audioFilePath!).deleteSync();
    }
    if (imageFilePath != null) {
      File(imageFilePath!).deleteSync();
    }

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
          'Document Abuse',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: TextFormField(
                  controller: textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Enter text here',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFDFBDDF),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AudioRecorder(
                                                onStop: (String path) {
                                                  setState(() {
                                                    audioFilePath = path;
                                                  });
                                                },
                                              )),
                                    );
                                  },
                                  text: 'Record',
                                  icon: const Icon(
                                    Icons.mic,
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
                                    if (audioFilePath != null) {
                                      File(audioFilePath!).deleteSync();
                                      setState(() {
                                        audioFilePath = null;
                                      });
                                    }
                                  },
                                  text: 'Clear',
                                  icon: Icon(
                                    Icons.delete,
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
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: audioFilePath == null
                                ? const Text("No Audio")
                                : FlutterFlowAudioPlayer(
                                    audio: Audio.file(
                                      audioFilePath!,
                                      metas: Metas(
                                        id: 'sample3.mp3-e01bi6lz',
                                        title: 'Recorded audio',
                                      ),
                                    ),
                                    titleTextStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                    playbackDurationTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF9D9D9D),
                                              fontSize: 12,
                                            ),
                                    fillColor: Color(0xFFEEEEEE),
                                    playbackButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryColor,
                                    activeTrackColor: Color(0xFF57636C),
                                    elevation: 4,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFDFBDDF),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final XFile? photo =
                                        await _picker.pickImage(
                                            source: ImageSource.camera,
                                            maxWidth: 600,
                                            maxHeight: 600);
                                    if (photo != null) {
                                      setState(() {
                                        imageFilePath = photo.path;
                                      });
                                    }
                                  },
                                  text: 'Picture',
                                  icon: Icon(
                                    Icons.photo_camera,
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
                                    if (imageFilePath != null) {
                                      File(imageFilePath!).deleteSync();
                                      setState(() {
                                        imageFilePath = null;
                                      });
                                    }
                                  },
                                  text: 'Clear',
                                  icon: Icon(
                                    Icons.delete,
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
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: imageFilePath == null
                                ? const Text("No Image")
                                : Image.file(
                                    File(imageFilePath!),
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: FFButtonWidget(
                        onPressed: () {
                          if (!_isReadOnly) _saveAndClear();
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
                          if (!_isReadOnly) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewEntriesWidget(
                                        table: 'documentAbuseDb',
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
    );
  }
}
