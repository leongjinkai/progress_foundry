import '/flutter_flow/flutter_flow_util.dart';
import 'generated_c_o_field_widget.dart' show GeneratedCOFieldWidget;
import 'package:flutter/material.dart';

class GeneratedCOFieldModel extends FlutterFlowModel<GeneratedCOFieldWidget> {
  ///  State fields for stateful widgets in this component.

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
