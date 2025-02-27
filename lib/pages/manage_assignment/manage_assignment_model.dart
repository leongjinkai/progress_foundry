import '/flutter_flow/flutter_flow_util.dart';
import '/pages/kids_dashboard/kids_home_page_t_b_c/kids_home_page_t_b_c_widget.dart';
import 'manage_assignment_widget.dart' show ManageAssignmentWidget;
import 'package:flutter/material.dart';

class ManageAssignmentModel extends FlutterFlowModel<ManageAssignmentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for KidsHomePageTBC component.
  late KidsHomePageTBCModel kidsHomePageTBCModel;

  @override
  void initState(BuildContext context) {
    kidsHomePageTBCModel = createModel(context, () => KidsHomePageTBCModel());
  }

  @override
  void dispose() {
    kidsHomePageTBCModel.dispose();
  }
}
