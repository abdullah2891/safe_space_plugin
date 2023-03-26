import 'dart:io';
import 'dart:typed_data';

import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../flutter_flow/flutter_flow_audio_player.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../database/document_abuse_db.dart';
import 'utils/widget_wrapper.dart';
import 'view_entries.dart';

class DocumentAbuseWidget extends AbstractTimestampedWidget {
  final DateTime? loadForTimstamp;
  const DocumentAbuseWidget({Key? key, this.loadForTimstamp}) : super(key: key);

  @override
  State<DocumentAbuseWidget> createState() => _DocumentAbuseWidgetState();

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
  late bool _isReadOnly;
  bool _isRecording = false;
  final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  bool _mRecorderIsInited = false;
  bool _hasText = false;

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
    _isReadOnly = widget.loadForTimstamp != null;
    if (widget.loadForTimstamp != null) {
      DocumentAbuseEntry.getFromTimestamp(widget.loadForTimstamp!)
          .then((entry) {
        textController.text = entry.text;
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
    if (!_isReadOnly) {
      openTheRecorder().then((value) {
        setState(() {
          _mRecorderIsInited = true;
        });
      });
    }
    textController.addListener(() {
      setState(() {
        _hasText = textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController.dispose();

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
      backgroundColor: const Color(0xFF987E98),
      appBar: AppBar(
        backgroundColor: const Color(0xFF987E98),
        automaticallyImplyLeading: true,
        title: Text(
          'Document Abuse',
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
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                WidgetWrapper(
                  isEnabled: !_isReadOnly,
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    maxLines: null,
                    minLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Enter text here',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      filled: true,
                      fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFFDFBDDF),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 10, 10, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                WidgetWrapper(
                                  isEnabled: !_isReadOnly && _mRecorderIsInited,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      if (_isRecording) {
                                        _stopRecording();
                                      } else {
                                        _startRecording();
                                      }
                                    },
                                    text: _isRecording ? 'Stop' : 'Record',
                                    icon: const Icon(
                                      Icons.mic,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100,
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
                                WidgetWrapper(
                                  isEnabled: !_isReadOnly,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
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
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100,
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: audioFilePath == null
                                  ? Text(_isRecording
                                      ? "Recording..."
                                      : "No Audio")
                                  : FlutterFlowAudioPlayer(
                                      audio: Audio.file(
                                        audioFilePath!,
                                        metas: Metas(
                                          id: 'sample3.mp3-e01bi6lz',
                                          title: 'Recorded audio',
                                        ),
                                      ),
                                      titleTextStyle:
                                          FlutterFlowTheme.of(context)
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
                                                color: const Color(0xFF9D9D9D),
                                                fontSize: 12,
                                              ),
                                      fillColor: const Color(0xFFEEEEEE),
                                      playbackButtonColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      activeTrackColor: const Color(0xFF57636C),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFFDFBDDF),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 10, 10, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                WidgetWrapper(
                                  isEnabled: !_isReadOnly,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
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
                                    icon: const Icon(
                                      Icons.photo_camera,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100,
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
                                WidgetWrapper(
                                  isEnabled: !_isReadOnly,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
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
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 15,
                                    ),
                                    options: FFButtonOptions(
                                      width: 100,
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WidgetWrapper(
                        isEnabled: !_isReadOnly && _hasData(),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: FFButtonWidget(
                          onPressed: () {
                            if (!_isReadOnly) _saveAndClear();
                          },
                          text: 'Save',
                          icon: const Icon(
                            Icons.save,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 140,
                            height: 40,
                            color: const Color(0xFF0B6B65),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
                      WidgetWrapper(
                        isEnabled: !_isReadOnly,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
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
                          icon: const Icon(
                            Icons.list,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 140,
                            height: 40,
                            color: const Color(0xFF0B6B65),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
        ),
      ),
    );
  }

  Future<void> openTheRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _mRecorder.openRecorder();
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

  void _startRecording() async {
    _mRecorder
        .startRecorder(
      toFile: "test_audio.mp4",
      codec: Codec.defaultCodec,
      audioSource: AudioSource.microphone,
    )
        .then((value) {
      setState(() {
        _isRecording = true;
      });
    });
  }

  void _stopRecording() async {
    await _mRecorder.stopRecorder().then((value) {
      setState(() {
        audioFilePath = value;
        // //var url = value;
        // _mplaybackReady = true;
        _isRecording = false;
      });
    });
  }

  bool _hasData() {
    return _hasText || audioFilePath != null || imageFilePath != null;
  }
}
