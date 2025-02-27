import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'parents_dashboard_widget.dart' show ParentsDashboardWidget;
import 'package:flutter/material.dart';

class ParentsDashboardModel extends FlutterFlowModel<ParentsDashboardWidget> {
  ///  Local state fields for this page.

  bool additionDetailsOpen = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Student Progress)] action in ParentsDashboard widget.
  ApiCallResponse? studentProgressResponse;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for RatingBar widget.
  double? ratingBarValue5;
  // State field(s) for RatingBar widget.
  double? ratingBarValue6;
  // State field(s) for RatingBar widget.
  double? ratingBarValue7;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (Create New Assignment)] action in Button widget.
  ApiCallResponse? createdAssignment;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
