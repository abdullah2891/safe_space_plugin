import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class FiveMinWalkWidget extends StatefulWidget {
  const FiveMinWalkWidget({Key? key}) : super(key: key);

  @override
  _FiveMinWalkWidgetState createState() => _FiveMinWalkWidgetState();
}

class _FiveMinWalkWidgetState extends State<FiveMinWalkWidget> {
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
          'Five Minute Walk',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: FlutterFlowStaticMap(
                  location: LatLng(9.341465, -79.891704),
                  apiKey: 'ENTER_YOUR_MAPBOX_API_KEY_HERE',
                  style: MapBoxStyle.Light,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(0),
                  zoom: 12,
                  tilt: 0,
                  rotation: 0,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Get Walks',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0x7F006B6B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                    print('Button pressed ...');
                  },
                  text: 'Previous Activity',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40,
                    color: Color(0x7F006B6B),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
      ),
    );
  }
}
