import '../../flutter_flow/flutter_flow_radio_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'technology_model.dart';
export 'technology_model.dart';
import '../../flutter_flow/flutter_flow_model.dart';

class TechnologyWidget extends StatefulWidget {
  const TechnologyWidget({Key? key}) : super(key: key);

  @override
  _TechnologyWidgetState createState() => _TechnologyWidgetState();
}

class _TechnologyWidgetState extends State<TechnologyWidget> {
  late TechnologyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TechnologyModel());
    TechnologyModel.getOnline().then((value) => {
          setState(() {
            _model = value;
          })
        });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: true,
          title: Text(
            'Technology',
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'DO YOU HAVE AND USE A CELL PHONE?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue1 = val),
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  initialValue:
                                      _model.radioButtonValue1 ?? 'hi',
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Text(
                                  'HAS YOUR PARTNER EVER CHECKED YOUR OUTGOING CALLS, TEXT MESSAGES, OR BROWSING HISTORY ON YOUR CELL PHONE OR COMPUTER?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue2 = val),
                                  optionHeight: 25,
                                  initialValue:
                                      _model.radioButtonValue2 ?? 'hi',
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Text(
                                  'DO YOU USE SOCIAL NETWORKING SITES?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  initialValue:
                                      _model.radioButtonValue3 ?? 'hi',
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue3 = val),
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Text(
                                  'HAS YOUR PARTNER EVER SENT YOU AN ABUSIVE EMAIL, TEXT MESSAGE, OR VOICEMAIL?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  initialValue:
                                      _model.radioButtonValue4 ?? 'hi',
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue4 = val),
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Text(
                                  'HAVE YOU SHARED PASSWORDS TO YOUR ONLINE ACCOUNTS WITH YOUR PARTNER?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  initialValue:
                                      _model.radioButtonValue5 ?? 'hi',
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue5 = val),
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Text(
                                  'DOES A TRUSTED FRIEND OR FAMILY MEMBER HAVE ACCESS TO YOUR ONLINE ACCOUNTS?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  initialValue:
                                      _model.radioButtonValue6 ?? 'hi',
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue6 = val),
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Text(
                                  'HAS YOUR PARTNER EVER PRETENDED TO BE YOU ONLINE?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  initialValue:
                                      _model.radioButtonValue7 ?? 'hi',
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue7 = val),
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                                Text(
                                  'HAVE YOU EVER SENT YOUR PARTNER PRIVATE PHOTOS OF YOURSELF?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                FlutterFlowRadioButton(
                                  options: ['Yes', 'No'].toList(),
                                  initialValue:
                                      _model.radioButtonValue8 ?? 'hi',
                                  onChanged: (val) => setState(
                                      () => _model.radioButtonValue8 = val),
                                  optionHeight: 25,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor: Colors.blue,
                                  inactiveRadioButtonColor: Color(0x8A000000),
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                            },
                            text: 'Save',
                            icon: Icon(
                              Icons.save,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
