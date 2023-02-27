import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../database/database_proxy.dart';

class TechnologyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RadioButton widget.
  String? radioButtonValue1;
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
  // State field(s) for RadioButton widget.
  String? radioButtonValue7;
  // State field(s) for RadioButton widget.
  String? radioButtonValue8;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods are added here.
  void saveOnline() async {
    DatabaseProxy('safetyPlanDb').put('technology', {
      'radioButtonValue1': radioButtonValue1,
      'radioButtonValue2': radioButtonValue2,
      'radioButtonValue3': radioButtonValue3,
      'radioButtonValue4': radioButtonValue4,
      'radioButtonValue5': radioButtonValue5,
      'radioButtonValue6': radioButtonValue6,
      'radioButtonValue7': radioButtonValue5,
      'radioButtonValue8': radioButtonValue6
    });
  }

  static Future<TechnologyModel> getOnline() async {
    final snapshot = await DatabaseProxy('safetyPlanDb').get('technology');
    TechnologyModel b = TechnologyModel();

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
      if (map['radioButtonValue7'] != null) {
        b.radioButtonValue7 = map['radioButtonValue7'] as String;
      }
      if (map['radioButtonValue8'] != null) {
        b.radioButtonValue8 = map['radioButtonValue8'] as String;
      }
    }

    return b;
  }
}
