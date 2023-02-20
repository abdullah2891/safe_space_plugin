import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../utility/auth.dart';
import '../../flutter_flow/flutter_flow_model.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RadioButton widget.
  String? radioButtonValue1;
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
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  // State field(s) for RadioButton widget.
  String? radioButtonValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
  }

  /// Additional helper methods are added here.
  void saveOnline() async {
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/children");

    dataRef.set({
      'textController1': textController1?.text,
      'textController2': textController2?.text,
      'textController3': textController3?.text,
      'textController4': textController4?.text,
    });
  }

  static Future<HomeModel> getOnline() async {
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/basics");
    final snapshot = await dataRef.get();
    HomeModel b = HomeModel();
    TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    TextEditingController t3 = TextEditingController();
    TextEditingController t4 = TextEditingController();
    b.textController1 = t1;
    b.textController2 = t2;
    b.textController3 = t3;
    b.textController4 = t4;

    if (snapshot.value != null) {
      if ((snapshot.value as Map)['textController1'] != null) {
        b.textController1?.text =
            (snapshot.value as Map)['textController1'] as String;
      }
      if ((snapshot.value as Map)['textController2'] != null) {
        b.textController2?.text =
            (snapshot.value as Map)['textController2'] as String;
      }
      if ((snapshot.value as Map)['textController3'] != null) {
        b.textController3?.text =
            (snapshot.value as Map)['textController3'] as String;
      }
      if ((snapshot.value as Map)['textController4'] != null) {
        b.textController3?.text =
            (snapshot.value as Map)['textController4'] as String;
      }
    }

    return b;
  }
}
