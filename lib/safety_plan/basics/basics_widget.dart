import '../../flutter_flow/flutter_flow_model.dart';
import '../../flutter_flow/flutter_flow_radio_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'basics_model.dart';
export 'basics_model.dart';
import 'package:safe_space_plugin/safety_plan/main/main_widget.dart';

class BasicsWidget extends StatefulWidget {
  const BasicsWidget({Key? key}) : super(key: key);

  @override
  _BasicsWidgetState createState() => _BasicsWidgetState();
}

class _BasicsWidgetState extends State<BasicsWidget> {
  late BasicsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BasicsModel());
    _model.textController ??= TextEditingController();
    BasicsModel.getOnline().then((value) => {
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
            'Basics',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -0.85),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'WHOM DO YOU LIVE WITH?',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              FlutterFlowRadioButton(
                                options: [
                                  'Family',
                                  'Roommates',
                                  'Alone',
                                  'With my partner'
                                ].toList(),
                                onChanged: (val) => setState(
                                    () => _model.radioButtonValue1 = val),
                                optionHeight: 25,
                                initialValue: _model.radioButtonValue1 ?? 'hi',
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
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'WHAT’S YOUR ZIP CODE?',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              TextFormField(
                                controller: _model.textController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'This will help us find resources in your community.',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
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
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                              Text(
                                'WHAT SCHOOL DO YOU ATTEND?',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              FlutterFlowRadioButton(
                                options: [
                                  'Middle school',
                                  'High school',
                                  'College/University',
                                  'I\'m not in school'
                                ].toList(),
                                onChanged: (val) => setState(
                                    () => _model.radioButtonValue2 = val),
                                optionHeight: 25,
                                initialValue: _model.radioButtonValue2 ?? 'hi',
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
                                'DO YOU HAVE A JOB?',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              FlutterFlowRadioButton(
                                options: ['Yes ', 'No'].toList(),
                                onChanged: (val) => setState(
                                    () => _model.radioButtonValue3 = val),
                                optionHeight: 25,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                initialValue: _model.radioButtonValue3 ?? 'hi',
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.vertical,
                                radioButtonColor: Colors.blue,
                                inactiveRadioButtonColor: Color(0x8A000000),
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                              Text(
                                'DO YOU HAVE CHILDREN (OR ARE YOU CURRENTLY PREGNANT)?',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              FlutterFlowRadioButton(
                                options: ['Yes', 'No'].toList(),
                                onChanged: (val) => setState(
                                    () => _model.radioButtonValue4 = val),
                                optionHeight: 25,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                                initialValue: _model.radioButtonValue4 ?? 'hi',
                                buttonPosition: RadioButtonPosition.left,
                                direction: Axis.vertical,
                                radioButtonColor: Colors.blue,
                                inactiveRadioButtonColor: Color(0x8A000000),
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                              Text(
                                'DO YOU IDENTIFY AS:',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              FlutterFlowRadioButton(
                                options: [
                                  'Straight',
                                  'Lesbian, gay, bisexual, or queer',
                                  'Other'
                                ].toList(),
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
                                initialValue: _model.radioButtonValue5 ?? 'hi',
                                direction: Axis.vertical,
                                radioButtonColor: Colors.blue,
                                inactiveRadioButtonColor: Color(0x8A000000),
                                toggleable: false,
                                horizontalAlignment: WrapAlignment.start,
                                verticalAlignment: WrapCrossAlignment.start,
                              ),
                              Text(
                                'ARE YOU:',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              FlutterFlowRadioButton(
                                options: [
                                  'Male',
                                  'Female',
                                  'Transgender',
                                  'Other'
                                ].toList(),
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
                                initialValue: _model.radioButtonValue6 ?? 'hi',
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
                ],
              ),
            ),
          ),
        ));
  }
}
