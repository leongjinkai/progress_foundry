import 'package:progress_foundry/components/generated_c_o_field_model.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/generated_ans_field_widget.dart';
import '/components/loading_widget.dart';
import '/components/question_bubble_new_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kid_addition_widget.dart' show KidAdditionWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class KidAdditionModel extends FlutterFlowModel<KidAdditionWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Specific Assignment)] action in KidAddition widget.
  ApiCallResponse? responseQuestionList;
  // Models for QuestionBubbleNew dynamic component.
  late FlutterFlowDynamicModels<QuestionBubbleNewModel> questionBubbleNewModels;
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
  // Models for generatedAnsField dynamic component.
  late FlutterFlowDynamicModels<GeneratedAnsFieldModel> generatedAnsFieldModels;
  // Stores action output result for [Backend Call - API (Attempt Question)] action in Button widget.
  // Models for generatedcarryOverField dynamic component.
  late FlutterFlowDynamicModels<GeneratedCOFieldModel> generatedCOFieldModels;
  ApiCallResponse? assignmentResponse;
  // Model for Loading component.
  late LoadingModel loadingModel;

  @override
  void initState(BuildContext context) {
    questionBubbleNewModels =
        FlutterFlowDynamicModels(() => QuestionBubbleNewModel());
    generatedAnsFieldModels =
        FlutterFlowDynamicModels(() => GeneratedAnsFieldModel());
    generatedCOFieldModels =
        FlutterFlowDynamicModels(() => GeneratedCOFieldModel());
    loadingModel = createModel(context, () => LoadingModel());
  }

  @override
  void dispose() {
    questionBubbleNewModels.dispose();
    timerController.dispose();
    unknownAnswerFocusNode?.dispose();
    unknownAnswerTextController?.dispose();

    generatedCOFieldModels.dispose();
    generatedAnsFieldModels.dispose();
    loadingModel.dispose();
  }
}
