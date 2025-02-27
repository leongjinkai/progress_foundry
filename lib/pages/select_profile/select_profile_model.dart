import '/flutter_flow/flutter_flow_util.dart';
import 'select_profile_widget.dart' show SelectProfileWidget;
import 'package:flutter/material.dart';

class SelectProfileModel extends FlutterFlowModel<SelectProfileWidget> {
  ///  Local state fields for this page.

  bool isManageProfile = false;

  bool enterPin = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
