import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../database/database_proxy.dart';

class PartnerModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
  }

  /// Additional helper methods are added here.
  void saveOnline() async {
    DatabaseProxy('safetyPlanDb').put('partner', {
      'textController1': textController1?.text,
      'textController2': textController2?.text,
      'textController3': textController3?.text,
      'textController4': textController4?.text,
    });
  }

  static Future<PartnerModel> getOnline() async {
    final snapshot = await DatabaseProxy('safetyPlanDb').get('partner');
    PartnerModel b = PartnerModel();
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    TextEditingController t3 = TextEditingController();
    TextEditingController t4 = TextEditingController();
    b.textController1 = t1;
    b.textController2 = t2;
    b.textController3 = t3;
    b.textController4 = t4;

    if (snapshot != null) {
      final map = snapshot as Map;
      if (map['textController1'] != null) {
        b.textController1?.text = map['textController1'] as String;
      }
      if (map['textController2'] != null) {
        b.textController2?.text = map['textController2'] as String;
      }
      if (map['textController3'] != null) {
        b.textController3?.text = map['textController3'] as String;
      }
      if (map['textController4'] != null) {
        b.textController3?.text = map['textController4'] as String;
      }
    }

    return b;
  }
}
