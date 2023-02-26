import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../utility/auth.dart';

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
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/basics");

    dataRef.set({
      'radioButtonValue1': radioButtonValue1,
      'radioButtonValue2': radioButtonValue2,
      'textController1': textController1?.text,
      'textController2': textController2?.text
    });
  }

  static Future<JobModel> getOnline() async {
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/basics");
    final snapshot = await dataRef.get();
    JobModel b = JobModel();
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();

    b.textController1 = t1;
    b.textController2 = t2;

    if (snapshot.value != null) {
      if ((snapshot.value as Map)['textController1'] != null) {
        b.textController1?.text =
            (snapshot.value as Map)['textController1'] as String;
      }
      if ((snapshot.value as Map)['textController2'] != null) {
        b.textController2?.text =
            (snapshot.value as Map)['textController2'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue1'] != null) {
        b.radioButtonValue1 =
            (snapshot.value as Map)['radioButtonValue1'] as String;
      }
      if ((snapshot.value as Map)['radioButtonValue2'] != null) {
        b.radioButtonValue2 =
            (snapshot.value as Map)['radioButtonValue2'] as String;
      }
    }

    return b;
  }
}
