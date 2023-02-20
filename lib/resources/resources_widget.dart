import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_model.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';

import 'resources_model.dart';
export 'resources_model.dart';

class ResourcesWidget extends StatefulWidget {
  const ResourcesWidget({Key? key}) : super(key: key);

  @override
  _ResourcesWidgetState createState() => _ResourcesWidgetState();
}

class _ResourcesWidgetState extends State<ResourcesWidget> {
  late ResourcesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  String url = 'https://www.rainn.org/warning-signs';
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResourcesModel());
  }

  String urlGet(String input) {
    List<String> strings = [
      'https://www.rainn.org/warning-signs',
      'https://apps.rainn.org/policy/',
      'https://www.rainn.org/types-sexual-violence',
      'https://www.rainn.org/safety-prevention',
      'https://www.rainn.org/safety-students'
    ];

    String mostSimilarString = '';
    double highestSimilarity = 0.0;

    for (String string in strings) {
      double similarity = StringSimilarity.compareTwoStrings(input, string);
      if (similarity > highestSimilarity) {
        mostSimilarString = string;
        highestSimilarity = similarity;
      }
    }

    return mostSimilarString;
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
        backgroundColor: Color(0xFF987E98),
        appBar: AppBar(
          backgroundColor: Color(0xFF987E98),
          automaticallyImplyLeading: true,
          title: Text(
            'Resources',
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: FlutterFlowDropDown<String>(
                      options: [
                        'Warning signs',
                        'Policy in your state',
                        'Types of sexual violence',
                        'Safety and prevention',
                        'Safety for students'
                      ],
                      onChanged: (val) =>
                          setState(() => url = urlGet(val as String)),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Please select...',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  FlutterFlowWebView(
                    url: url,
                    bypass: false,
                    height: MediaQuery.of(context).size.height * 1,
                    verticalScroll: false,
                    horizontalScroll: false,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
