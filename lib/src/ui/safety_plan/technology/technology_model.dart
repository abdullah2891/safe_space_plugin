import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../utility/auth.dart';

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
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/basics");

    dataRef.set({
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
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/basics");
    final snapshot = await dataRef.get();
    TechnologyModel b = TechnologyModel();

    if (snapshot.value != null) {
      if ((snapshot.value as Map)['radioButtonValue1'] != null) {
        b.radioButtonValue1 =
            (snapshot.value as Map)['radioButtonValue1'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue2'] != null) {
        b.radioButtonValue2 =
            (snapshot.value as Map)['radioButtonValue2'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue3'] != null) {
        b.radioButtonValue3 =
            (snapshot.value as Map)['radioButtonValue3'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue4'] != null) {
        b.radioButtonValue4 =
            (snapshot.value as Map)['radioButtonValue4'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue5'] != null) {
        b.radioButtonValue3 =
            (snapshot.value as Map)['radioButtonValue5'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue6'] != null) {
        b.radioButtonValue6 =
            (snapshot.value as Map)['radioButtonValue6'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue7'] != null) {
        b.radioButtonValue7 =
            (snapshot.value as Map)['radioButtonValue7'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue8'] != null) {
        b.radioButtonValue8 =
            (snapshot.value as Map)['radioButtonValue8'] as String;
      }
    }

    return b;
  }
}
