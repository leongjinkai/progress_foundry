import '/flutter_flow/flutter_flow_util.dart';
import 'enter_password_widget.dart' show EnterPasswordWidget;
import 'package:flutter/material.dart';

class EnterPasswordModel extends FlutterFlowModel<EnterPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode1;
  TextEditingController? emailFieldTextController1;
  String? Function(BuildContext, String?)? emailFieldTextController1Validator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode2;
  TextEditingController? emailFieldTextController2;
  String? Function(BuildContext, String?)? emailFieldTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFieldFocusNode1?.dispose();
    emailFieldTextController1?.dispose();

    emailFieldFocusNode2?.dispose();
    emailFieldTextController2?.dispose();
  }
}
