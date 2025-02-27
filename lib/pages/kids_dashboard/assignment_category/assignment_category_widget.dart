import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/kids_dashboard/assignment_practice_card/assignment_practice_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'assignment_category_model.dart';
export 'assignment_category_model.dart';

class AssignmentCategoryWidget extends StatefulWidget {
  const AssignmentCategoryWidget({
    super.key,
    required this.qntype,
  });

  final String? qntype;

  @override
  State<AssignmentCategoryWidget> createState() =>
      _AssignmentCategoryWidgetState();
}

class _AssignmentCategoryWidgetState extends State<AssignmentCategoryWidget> {
  late AssignmentCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignmentCategoryModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.qntype,
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
              ),
              ClipRRect(
                child: Container(
                  width: 650.0,
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/divider.svg',
                      height: 2.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Builder(
            builder: (context) {
              final additionAssignments = FFAppState()
                  .PracticeList
                  .where((e) => widget.qntype == e.type?.name)
                  .toList()
                  .take(4)
                  .toList();

              return Row(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(additionAssignments.length,
                    (additionAssignmentsIndex) {
                  final additionAssignmentsItem =
                      additionAssignments[additionAssignmentsIndex];
                  return AssignmentPracticeCardWidget(
                    key: Key(
                        'Keyfmm_${additionAssignmentsIndex}_of_${additionAssignments.length}'),
                    assignmentInfo: additionAssignmentsItem,
                    idx: additionAssignmentsIndex,
                  );
                }).divide(const SizedBox(width: 20.0)),
              );
            },
          ),
        ].divide(const SizedBox(height: 46.0)),
      ),
    );
  }
}
