import '/backend/api_requests/api_calls.dart';
import '/components/active_assignment_card_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kids_home_page_assignment_widget.dart'
    show KidsHomePageAssignmentWidget;
import 'package:flutter/material.dart';

class KidsHomePageAssignmentModel
    extends FlutterFlowModel<KidsHomePageAssignmentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Assignments by Student Id)] action in KidsHomePageAssignment widget.
  ApiCallResponse? assignmentList;
  // Models for ActiveAssignmentCard dynamic component.
  late FlutterFlowDynamicModels<ActiveAssignmentCardModel>
      activeAssignmentCardModels;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    activeAssignmentCardModels =
        FlutterFlowDynamicModels(() => ActiveAssignmentCardModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    activeAssignmentCardModels.dispose();
    loadingModel.dispose();
  }
}
