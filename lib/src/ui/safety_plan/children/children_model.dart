import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../database/database_proxy.dart';

class ChildrenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for RadioButton widget.
  String? radioButtonValue;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  void saveOnline() async {
    DatabaseProxy('safetyPlanDb').put('children', {
      'textController1': textController1?.text,
      'textController2': textController2?.text,
      'textController3': textController3?.text,
    });
  }

  static Future<ChildrenModel> getOnline() async {
    final snapshot = await DatabaseProxy('safetyPlanDb').get('children');
    ChildrenModel b = ChildrenModel();
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    TextEditingController t3 = TextEditingController();
    b.textController1 = t1;
    b.textController2 = t2;
    b.textController3 = t3;

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
    }

    return b;
  }

  /// Additional helper methods are added here.
}
