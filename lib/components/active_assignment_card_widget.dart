import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'active_assignment_card_model.dart';
export 'active_assignment_card_model.dart';

class ActiveAssignmentCardWidget extends StatefulWidget {
  const ActiveAssignmentCardWidget({
    super.key,
    required this.dueDateParam,
    required this.qnTopicParam,
    required this.qnLevelParam,
    required this.completionRateParam,
    this.assignmentId,
    required this.qnTopic,
  });

  final String? dueDateParam;
  final String? qnTopicParam;
  final String? qnLevelParam;
  final double? completionRateParam;
  final String? assignmentId;
  final String? qnTopic;

  @override
  State<ActiveAssignmentCardWidget> createState() =>
      _ActiveAssignmentCardWidgetState();
}

class _ActiveAssignmentCardWidgetState
    extends State<ActiveAssignmentCardWidget> {
  late ActiveAssignmentCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveAssignmentCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1024.0,
      height: 119.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).alternate,
            offset: const Offset(
              0.0,
              5.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(49.0, 0.0, 49.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  valueOrDefault<String>(
                    functions.getAssigmentCardContentHeader(
                        widget.qnTopicParam!, widget.qnLevelParam!),
                    '?',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 23.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        lineHeight: 1.5,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (widget.qnTopic == 'ADDITION' || widget.qnTopic == "SUBTRACTION") {
                        context.pushNamed(
                          'KidAddition',
                          queryParameters: {
                            'assignmentId': serializeParam(
                              widget.assignmentId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        return;
                      } else {
                        if (widget.qnTopic == 'DIVISION') {
                          context.pushNamed(
                            'KidDivison',
                            queryParameters: {
                              'assignmentId': serializeParam(
                                widget.assignmentId,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );

                          return;
                        } else {
                          if (widget.qnTopic == 'MULTIPLICATION') {
                            context.pushNamed('KidMultiplication');

                            return;
                          } else {
                            context.pushNamed(
                              'KidWordProblem',
                              queryParameters: {
                                'assignmentId': serializeParam(
                                  widget.assignmentId,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          }
                        }
                      }
                    },
                    text: 'Continue  >',
                    options: FFButtonOptions(
                      height: 38.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'DM Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearPercentIndicator(
                  percent: widget.completionRateParam!,
                  width: 660.0,
                  lineHeight: 23.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: const Color(0xFF81E770),
                  backgroundColor: const Color(0xFFE0FFDB),
                  center: Text(
                    valueOrDefault<String>(
                      functions.getProgressText(
                          widget.completionRateParam!.toString()),
                      '?',
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          lineHeight: 1.5,
                        ),
                  ),
                  barRadius: const Radius.circular(6.0),
                  padding: EdgeInsets.zero,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Due date:  ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: const Color(0xFFAAAAAA),
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.dueDateParam,
                        '?',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ]
              .divide(const SizedBox(height: 2.0))
              .addToStart(const SizedBox(height: 22.0))
              .addToEnd(const SizedBox(height: 22.0)),
        ),
      ),
    );
  }
}
