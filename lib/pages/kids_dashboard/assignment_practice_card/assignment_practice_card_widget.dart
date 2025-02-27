import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'assignment_practice_card_model.dart';
export 'assignment_practice_card_model.dart';

class AssignmentPracticeCardWidget extends StatefulWidget {
  const AssignmentPracticeCardWidget({
    super.key,
    required this.assignmentInfo,
    required this.idx,
  });

  final AssignmentStruct? assignmentInfo;
  final int? idx;

  @override
  State<AssignmentPracticeCardWidget> createState() =>
      _AssignmentPracticeCardWidgetState();
}

class _AssignmentPracticeCardWidgetState
    extends State<AssignmentPracticeCardWidget> {
  late AssignmentPracticeCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignmentPracticeCardModel());

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
      width: 154.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 154.0,
            height: 154.0,
            decoration: BoxDecoration(
              color: () {
                if (widget.idx == 0) {
                  return FlutterFlowTheme.of(context).alternate;
                } else if (widget.idx == 1) {
                  return const Color(0xFF69A5FF);
                } else if (widget.idx == 2) {
                  return const Color(0xFF2C80FF);
                } else {
                  return FlutterFlowTheme.of(context).primary;
                }
              }(),
              borderRadius: BorderRadius.circular(15.0),
            ),
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: AutoSizeText(
              valueOrDefault<String>(
                widget.assignmentInfo?.category,
                '?',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 19.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    lineHeight: 1.5,
                  ),
            ),
          ),
          LinearPercentIndicator(
            percent: valueOrDefault<double>(
              widget.assignmentInfo?.progress,
              0.0,
            ),
            width: 154.0,
            lineHeight: 30.0,
            animation: true,
            animateFromLastPercent: true,
            progressColor: const Color(0xFF81E770),
            backgroundColor: const Color(0xFFE0FFDB),
            center: Text(
              '50%',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Poppins',
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            barRadius: const Radius.circular(6.0),
            padding: EdgeInsets.zero,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: RatingBarIndicator(
                  itemBuilder: (context, index) => const Icon(
                    Icons.star_rate_sharp,
                    color: Color(0xFFF6D826),
                  ),
                  direction: Axis.horizontal,
                  rating: valueOrDefault<double>(
                    widget.assignmentInfo?.rating,
                    0.0,
                  ),
                  unratedColor: FlutterFlowTheme.of(context).primaryText,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 0.0),
                  itemSize: 26.0,
                ),
              ),
            ],
          ),
        ].divide(const SizedBox(height: 8.0)),
      ),
    );
  }
}
