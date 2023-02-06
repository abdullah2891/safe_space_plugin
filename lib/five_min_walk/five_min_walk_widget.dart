import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '../views/view_entries.dart';
import 'package:safe_space_plugin/database/phyical_activities_db.dart';

class FiveMinWalkWidget extends StatefulWidget {
  const FiveMinWalkWidget({Key? key}) : super(key: key);

  @override
  _FiveMinWalkWidgetState createState() => _FiveMinWalkWidgetState();
}

class _FiveMinWalkWidgetState extends State<FiveMinWalkWidget> {
  int _seconds = 0;
  bool _isRunning = false;
  bool _isReadOnly = false;
  late Timer _timer;

  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (_isRunning) {
        if (event.x > 0.5) {
          setState(() {
            _stepCount++;
          });
        }
      }
    });
  }

  void _saveAndClear() {
    final entry =
        PhysicalAcvitityDbEntry(_seconds as String, _stepCount as String);
    entry.saveEntry();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _stepCount = 0;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _seconds = 0;
      _isRunning = false;
    });
    _timer.cancel();
  }

  int _stepCount = 0;
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
          'Pedometer',
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
              Image.asset(
                'packages/safe_space_plugin/assets/images/pedometer.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Text(
                'Steps: ${_stepCount}',
                style: FlutterFlowTheme.of(context).title1,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      _startTimer();
                    },
                    text: 'Start',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).secondaryColor,
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
                  FFButtonWidget(
                    onPressed: () {
                      _stopTimer();
                    },
                    text: 'Stop',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).secondaryColor,
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
                                  builder: (context) => const ViewEntriesWidget<
                                          FiveMinWalkWidget>(
                                        table: 'pedometerDb',
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
