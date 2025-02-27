import '/flutter_flow/flutter_flow_util.dart';
import 'generated_ans_field_widget.dart' show GeneratedAnsFieldWidget;
import 'package:flutter/material.dart';

class GeneratedAnsFieldModel extends FlutterFlowModel<GeneratedAnsFieldWidget> {
  ///  Local state fields for this component.

  String? inputState;

  ///  State fields for stateful widgets in this component.

  // State field(s) for AnsField widget.
  FocusNode? ansFieldFocusNode;
  TextEditingController? ansFieldTextController;
  String? Function(BuildContext, String?)? ansFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ansFieldFocusNode?.dispose();
    ansFieldTextController?.dispose();
  }
}
