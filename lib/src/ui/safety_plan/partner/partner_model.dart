import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../utility/auth.dart';

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
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/children");

    dataRef.set({
      'textController1': textController1?.text,
      'textController2': textController2?.text,
      'textController3': textController3?.text,
      'textController4': textController4?.text,
    });
  }

  static Future<PartnerModel> getOnline() async {
    DatabaseReference dataRef = FirebaseDatabase.instance
        .ref("${Auth().currentUser!.uid}/data/safetyPlanDb/basics");
    final snapshot = await dataRef.get();
    PartnerModel b = PartnerModel();
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
