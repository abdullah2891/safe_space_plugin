import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../database/phyical_activities_db.dart';
import 'utils/widget_wrapper.dart';
import 'view_entries.dart';

class FiveMinWalkWidget extends AbstractTimestampedWidget {
  final DateTime? loadForTimstamp;
  const FiveMinWalkWidget({Key? key, this.loadForTimstamp}) : super(key: key);

  @override
  State<FiveMinWalkWidget> createState() => _FiveMinWalkWidgetState();

  @override
  Widget clone(DateTime timestamp) =>
      FiveMinWalkWidget(loadForTimstamp: timestamp);
}

class _FiveMinWalkWidgetState extends State<FiveMinWalkWidget> {
  int _seconds = 0;
  bool _isRunning = false;
  late bool _isReadOnly;
  late Timer _timer;
  late StreamSubscription<StepCount> _streamSubscription;
  int _stepCount = 0;
  int _baselineCount = 0;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _isReadOnly = widget.loadForTimstamp != null;
    _streamSubscription = Pedometer.stepCountStream.listen((StepCount event) {
      if (_isRunning) {
        int steps = event.steps;
        if (_baselineCount == -1) {
          _baselineCount = event.steps;
          setState(() {
            _baselineCount = _baselineCount;
          });
          steps = 0;
        } else {
          steps = event.steps - _baselineCount;
        }
        setState(() {
          _stepCount = steps;
        });
      }
    });
  }

  void _saveAndClear() {
    final entry =
        PhysicalAcvitityDbEntry(_seconds.toString(), _stepCount.toString());
    entry.saveEntry();
  }

  void _toggleRunning() {
    if (_isRunning) {
      _timer.cancel();
      setState(() {
        _isRunning = !_isRunning;
      });
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
      setState(() {
        _isRunning = !_isRunning;
        _baselineCount = -1;
        _stepCount = 0;
      });
    }
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    try {
      if (_isRunning) {
        _timer.cancel();
      }
      _streamSubscription.cancel();
    } catch (e) {
      debugPrint(e.toString());
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
          'Pedometer',
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
                'Steps: $_stepCount',
                style: FlutterFlowTheme.of(context).title1,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WidgetWrapper(
                    isEnabled: !_isReadOnly,
                    child: FFButtonWidget(
                      onPressed: () {
                        _toggleRunning();
                      },
                      text: _isRunning ? 'Stop' : 'Start',
                      options: FFButtonOptions(
                        width: 300,
                        height: 40,
                        color: FlutterFlowTheme.of(context).secondaryColor,
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WidgetWrapper(
                      isEnabled: !_isReadOnly,
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: FFButtonWidget(
                        onPressed: () {
                          _saveAndClear();
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
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewEntriesWidget(
                                    table: 'pedometerDb', parent: widget)),
                          );
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
    );
  }
}
