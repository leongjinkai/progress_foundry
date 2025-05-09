import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'assignment_card_model.dart';
export 'assignment_card_model.dart';

class AssignmentCardWidget extends StatefulWidget {
  const AssignmentCardWidget({
    super.key,
    required this.assignment,
  });

  final StudentAssignmentStruct? assignment;

  @override
  State<AssignmentCardWidget> createState() => _AssignmentCardWidgetState();
}

class _AssignmentCardWidgetState extends State<AssignmentCardWidget> {
  late AssignmentCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignmentCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(250.0, 0.0, 250.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 120.0,
        decoration: const BoxDecoration(),
        child: Container(
          width: 1024.0,
          height: 119.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        functions.getAssigmentCardContentHeader(
                            widget.assignment!.questionTopic,
                            widget.assignment!.questionLevel, widget.assignment!.questionType),
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
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LinearPercentIndicator(
                      percent: 0.6,
                      width: 660.0,
                      lineHeight: 36.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: const Color(0xFF81E770),
                      backgroundColor: const Color(0xFFE0FFDB),
                      center: Text(
                        '60%',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: const Color(0xFFAAAAAA),
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.5,
                                  ),
                        ),
                        Text(
                          '12/09/2024',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                  .divide(const SizedBox(height: 6.0))
                  .addToStart(const SizedBox(height: 11.0))
                  .addToEnd(const SizedBox(height: 11.0)),
            ),
          ),
        ),
      ),
    );
  }
}
