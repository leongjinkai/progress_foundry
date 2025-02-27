import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/generated_ans_field_widget.dart';
import '/components/generated_c_o_field_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kid_divison_widget.dart' show KidDivisonWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class KidDivisonModel extends FlutterFlowModel<KidDivisonWidget> {
  ///  Local state fields for this page.

  List<NormalQuestionStruct> questionDetail = [];
  void addToQuestionDetail(NormalQuestionStruct item) =>
      questionDetail.add(item);
  void removeFromQuestionDetail(NormalQuestionStruct item) =>
      questionDetail.remove(item);
  void removeAtIndexFromQuestionDetail(int index) =>
      questionDetail.removeAt(index);
  void insertAtIndexInQuestionDetail(int index, NormalQuestionStruct item) =>
      questionDetail.insert(index, item);
  void updateQuestionDetailAtIndex(
          int index, Function(NormalQuestionStruct) updateFn) =>
      questionDetail[index] = updateFn(questionDetail[index]);

  QuestionResponseDTOStruct? newSelectedQnDetail;
  void updateNewSelectedQnDetailStruct(
      Function(QuestionResponseDTOStruct) updateFn) {
    updateFn(newSelectedQnDetail ??= QuestionResponseDTOStruct());
  }

  List<AssignmentResponseDTOStruct> divisionQnList = [];
  void addToDivisionQnList(AssignmentResponseDTOStruct item) =>
      divisionQnList.add(item);
  void removeFromDivisionQnList(AssignmentResponseDTOStruct item) =>
      divisionQnList.remove(item);
  void removeAtIndexFromDivisionQnList(int index) =>
      divisionQnList.removeAt(index);
  void insertAtIndexInDivisionQnList(
          int index, AssignmentResponseDTOStruct item) =>
      divisionQnList.insert(index, item);
  void updateDivisionQnListAtIndex(
          int index, Function(AssignmentResponseDTOStruct) updateFn) =>
      divisionQnList[index] = updateFn(divisionQnList[index]);

  int? divisionSelectedQn = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Specific Assignment)] action in KidDivison widget.
  ApiCallResponse? responseQuestionList;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for UnknownAnswer widget.
  FocusNode? unknownAnswerFocusNode;
  TextEditingController? unknownAnswerTextController;
  String? Function(BuildContext, String?)? unknownAnswerTextControllerValidator;
  // Model for generatedCOField component.
  late GeneratedCOFieldModel generatedCOFieldModel;
  // Models for generatedAnsField dynamic component.
  late FlutterFlowDynamicModels<GeneratedAnsFieldModel>
      generatedAnsFieldModels1;
  // Models for generatedAnsField dynamic component.
  late FlutterFlowDynamicModels<GeneratedAnsFieldModel>
      generatedAnsFieldModels2;
  // Models for generatedAnsField dynamic component.
  late FlutterFlowDynamicModels<GeneratedAnsFieldModel>
      generatedAnsFieldModels3;
  // Models for generatedAnsField dynamic component.
  late FlutterFlowDynamicModels<GeneratedAnsFieldModel>
      generatedAnsFieldModels4;
  // Stores action output result for [Backend Call - API (Attempt Question)] action in Button widget.
  ApiCallResponse? assignmentResponse;

  @override
  void initState(BuildContext context) {
    generatedCOFieldModel = createModel(context, () => GeneratedCOFieldModel());
    generatedAnsFieldModels1 =
        FlutterFlowDynamicModels(() => GeneratedAnsFieldModel());
    generatedAnsFieldModels2 =
        FlutterFlowDynamicModels(() => GeneratedAnsFieldModel());
    generatedAnsFieldModels3 =
        FlutterFlowDynamicModels(() => GeneratedAnsFieldModel());
    generatedAnsFieldModels4 =
        FlutterFlowDynamicModels(() => GeneratedAnsFieldModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    unknownAnswerFocusNode?.dispose();
    unknownAnswerTextController?.dispose();

    generatedCOFieldModel.dispose();
    generatedAnsFieldModels1.dispose();
    generatedAnsFieldModels2.dispose();
    generatedAnsFieldModels3.dispose();
    generatedAnsFieldModels4.dispose();
  }
}
