import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../database/database_proxy.dart';

class JobModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for RadioButton widget.
  String? radioButtonValue1;
  // State field(s) for RadioButton widget.
  String? radioButtonValue2;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
  }

  /// Additional helper methods are added here.
  void saveOnline() async {
    DatabaseProxy('safetyPlanDb').put('job', {
      'radioButtonValue1': radioButtonValue1,
      'radioButtonValue2': radioButtonValue2,
      'textController1': textController1?.text,
      'textController2': textController2?.text
    });
  }

  static Future<JobModel> getOnline() async {
    final snapshot = await DatabaseProxy('safetyPlanDb').get('job');
    JobModel b = JobModel();
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();

    b.textController1 = t1;
    b.textController2 = t2;

    if (snapshot != null) {
      final map = snapshot as Map;
      if (map['textController1'] != null) {
        b.textController1?.text = map['textController1'] as String;
      }
      if (map['textController2'] != null) {
        b.textController2?.text = map['textController2'] as String;
      }
      if (map['radioButtonValue1'] != null) {
        b.radioButtonValue1 = map['radioButtonValue1'] as String;
      }
      if (map['radioButtonValue2'] != null) {
        b.radioButtonValue2 = map['radioButtonValue2'] as String;
      }
    }

    return b;
  }
}
