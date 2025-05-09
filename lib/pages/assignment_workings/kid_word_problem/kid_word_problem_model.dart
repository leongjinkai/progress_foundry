import 'package:progress_foundry/components/generated_ans_field_model.dart';
import 'package:progress_foundry/components/generated_c_o_field_model.dart';
import 'package:progress_foundry/index.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/loading_widget.dart';
import '/components/question_bubble_new_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kid_word_problem_widget.dart' show KidWordProblemWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class KidWordProblemModel extends FlutterFlowModel<KidAdditionWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Get Specific Assignment)] action in KidWordProblem widget.
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

  // Stores action output result for [Backend Call - API (Attempt Question)] action in Button widget.
  ApiCallResponse? assignmentResponse;
  late FlutterFlowDynamicModels<GeneratedCOFieldModel> generatedCOFieldModels;
  late FlutterFlowDynamicModels<GeneratedAnsFieldModel> generatedAnsFieldModels;
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
    loadingModel.dispose();
  }
}
