import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'question_bubble_new_model.dart';
export 'question_bubble_new_model.dart';

class QuestionBubbleNewWidget extends StatefulWidget {
  const QuestionBubbleNewWidget({
    super.key,
    this.questionNumber,
    required this.questionAttempt,
  });

  final int? questionNumber;
  final AssignmentResponseDTOStruct? questionAttempt;

  @override
  State<QuestionBubbleNewWidget> createState() =>
      _QuestionBubbleNewWidgetState();
}

class _QuestionBubbleNewWidgetState extends State<QuestionBubbleNewWidget> {
  late QuestionBubbleNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionBubbleNewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          FFAppState().selectedQuestion = widget.questionNumber!;
          safeSetState(() {});
          FFAppState().newSelectedQnDetail = FFAppState()
              .newQuestionList
              .elementAtOrNull((widget.questionNumber!) - 1)!
              .questionResponseDTO;
          _model.updatePage(() {});
          // Clear ansList
          FFAppState().ansList = [];
          _model.updatePage(() {});
          await Future.delayed(const Duration(milliseconds: 100));
          // Reset Answer Input
          FFAppState().ansList = ["", "", "", ""].toList().cast<String>();
          _model.updatePage(() {});
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 66.0,
          decoration: BoxDecoration(
            color: widget.questionNumber == FFAppState().selectedQuestion
                ? const Color(0xFFE0ECFF)
                : const Color(0x00000000),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: widget.questionNumber == FFAppState().selectedQuestion
                  ? FlutterFlowTheme.of(context).primary
                  : const Color(0x00000000),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: () {
                        if (widget.questionAttempt!
                            .normalQuestionAttemptResponseDTO.isCorrect) {
                          return const Color(0xFF81E770);
                        } else if (widget.questionAttempt!
                                .normalQuestionAttemptResponseDTO
                                .hasIsCorrect() &&
                            !widget.questionAttempt!
                                .normalQuestionAttemptResponseDTO.isCorrect) {
                          return FlutterFlowTheme.of(context).error;
                        } else if (widget.questionNumber ==
                            FFAppState().selectedQuestion) {
                          return FlutterFlowTheme.of(context).primary;
                        } else {
                          return const Color(0x00000000);
                        }
                      }(),
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: const Color(0xFFACCDFF),
                      ),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.questionNumber?.toString(),
                        '1',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: () {
                              if (widget.questionAttempt!
                                  .normalQuestionAttemptResponseDTO.isCorrect) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (widget.questionNumber ==
                                  FFAppState().selectedQuestion) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (widget.questionAttempt!
                                      .normalQuestionAttemptResponseDTO
                                      .hasIsCorrect() &&
                                  !widget
                                      .questionAttempt!
                                      .normalQuestionAttemptResponseDTO
                                      .isCorrect) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else {
                                return const Color(0xFFACCDFF);
                              }
                            }(),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${widget.questionNumber?.toString()}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                    if (FFAppState()
                        .correctQns
                        .toList()
                        .contains((widget.questionNumber!)))
                      Text(
                        'Correct Answer',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              color: const Color(0xFF9B9B9B),
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                  ],
                ),
              ].divide(const SizedBox(width: 11.0)),
            ),
          ),
        ),
      ),
    );
  }
}
