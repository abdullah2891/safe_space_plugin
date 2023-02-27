import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../database/database_proxy.dart';

class BasicsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RadioButton widget.
  String? radioButtonValue1;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RadioButton widget.
  String? radioButtonValue2;
  // State field(s) for RadioButton widget.
  String? radioButtonValue3;
  // State field(s) for RadioButton widget.
  String? radioButtonValue4;
  // State field(s) for RadioButton widget.
  String? radioButtonValue5;
  // State field(s) for RadioButton widget.
  String? radioButtonValue6;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textController?.dispose();
  }

  /// Additional helper methods are added here.
  void saveOnline() async {
    DatabaseProxy('safetyPlanDb').put('basics', {
      'radioButtonValue1': radioButtonValue1,
      'textController': textController?.text,
      'radioButtonValue2': radioButtonValue2,
      'radioButtonValue3': radioButtonValue3,
      'radioButtonValue4': radioButtonValue4,
      'radioButtonValue5': radioButtonValue5,
      'radioButtonValue6': radioButtonValue6
    });
  }

  static Future<BasicsModel> getOnline() async {
    final snapshot = await DatabaseProxy('safetyPlanDb').get('basics');
    BasicsModel b = BasicsModel();
    TextEditingController t = TextEditingController();
    b.textController = t;

    if (snapshot != null) {
      final map = snapshot as Map;
      if (map['radioButtonValue1'] != null) {
        b.radioButtonValue1 = map['radioButtonValue1'] as String;
      }
      if (map['radioButtonValue2'] != null) {
        b.radioButtonValue2 = map['radioButtonValue2'] as String;
      }
      if (map['radioButtonValue3'] != null) {
        b.radioButtonValue3 = map['radioButtonValue3'] as String;
      }
      if (map['radioButtonValue4'] != null) {
        b.radioButtonValue4 = map['radioButtonValue4'] as String;
      }
      if (map['radioButtonValue5'] != null) {
        b.radioButtonValue3 = map['radioButtonValue5'] as String;
      }
      if (map['radioButtonValue6'] != null) {
        b.radioButtonValue6 = map['radioButtonValue6'] as String;
      }
      if (map['textController'] != null) {
        b.textController?.text = map['textController'] as String;
      }
    }

    return b;
  }
}
