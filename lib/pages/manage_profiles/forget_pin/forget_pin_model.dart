import '/flutter_flow/flutter_flow_util.dart';
import 'forget_pin_widget.dart' show ForgetPinWidget;
import 'package:flutter/material.dart';

class ForgetPinModel extends FlutterFlowModel<ForgetPinWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
