import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_model.dart';
import 'package:safe_space_plugin/safety_plan/basics/basics_widget.dart';
import 'package:safe_space_plugin/safety_plan/children/children_widget.dart';
import 'package:safe_space_plugin/safety_plan/home/home_widget.dart';
import 'package:safe_space_plugin/safety_plan/job/job_widget.dart';
import 'package:safe_space_plugin/safety_plan/partner/partner_widget.dart';
import 'package:safe_space_plugin/safety_plan/school/school_widget.dart';
import 'package:safe_space_plugin/safety_plan/technology/technology_widget.dart';
import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());
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
            'Safety Plan',
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
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Text(
                      'A safety plan is a set of actions that can help lower your risk of being hurt by your partner. It includes information specific to you and your life that will increase your safety at school, home, and other places that you go on a daily basis. All the categories below are optional, so feel free to fill out the ones that are most relavent.',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BasicsWidget()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'Basics',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeWidget()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'Home',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SchoolWidget()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'School',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TechnologyWidget()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'Technology',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JobWidget()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'Job',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChildrenWidget()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'Children',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PartnerWidget()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'Partner',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF303030),
                              size: 20,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            dense: false,
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
