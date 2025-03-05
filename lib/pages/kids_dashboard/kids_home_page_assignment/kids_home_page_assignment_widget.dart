import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/active_assignment_card_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'kids_home_page_assignment_model.dart';
export 'kids_home_page_assignment_model.dart';

class KidsHomePageAssignmentWidget extends StatefulWidget {
  const KidsHomePageAssignmentWidget({super.key});

  @override
  State<KidsHomePageAssignmentWidget> createState() =>
      _KidsHomePageAssignmentWidgetState();
}

class _KidsHomePageAssignmentWidgetState
    extends State<KidsHomePageAssignmentWidget> {
  late KidsHomePageAssignmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidsHomePageAssignmentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = true;
      safeSetState(() {});
      _model.assignmentList =
          await LiveQuestionManagementGroup.getAssignmentsByStudentIdCall.call(
        authToken: currentJwtToken,
      );

      if ((_model.assignmentList?.succeeded ?? true)) {
        FFAppState().AssignmentList = ((_model.assignmentList?.jsonBody ?? '')
                .toList()
                .map<StudentAssignmentStruct?>(
                    StudentAssignmentStruct.maybeFromMap)
                .toList() as Iterable<StudentAssignmentStruct?>)
            .withoutNulls
            .toList()
            .cast<StudentAssignmentStruct>();
        _model.updatePage(() {});
        FFAppState().isLoading = false;
        safeSetState(() {});
      }
    });

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 1024.0,
          height: 189.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(47.0, 0.0, 0.0, 0.0),
            child: Text(
              'Hi Marchie, let’s check today assigment',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 33.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    lineHeight: 1.5,
                  ),
            ),
          ),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 1024.0,
                height: 38.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    'Active Assignment',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 42.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              'assets/images/sort.svg',
                              width: 36.0,
                              height: 36.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: !FFAppState().isLoading,
                          child: Builder(
                            builder: (context) {
                              final assignment =
                                  ((_model.assignmentList?.jsonBody ?? '')
                                                  .toList()
                                                  .map<StudentAssignmentStruct?>(
                                                      StudentAssignmentStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  StudentAssignmentStruct?>)
                                          .withoutNulls
                                          .map((e) => e)
                                          .toList()
                                          .toList() ??
                                      [];

                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(assignment.length,
                                      (assignmentIndex) {
                                    final assignmentItem =
                                        assignment[assignmentIndex];
                                    return wrapWithModel(
                                      model: _model.activeAssignmentCardModels
                                          .getModel(
                                        assignmentItem.id.toString(),
                                        assignmentIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: ActiveAssignmentCardWidget(
                                        key: Key(
                                          'Key2v5_${assignmentItem.id}',
                                        ),
                                        dueDateParam: assignmentItem.dueDate,
                                        qnTopicParam:
                                            assignmentItem.questionTopic,
                                        qnLevelParam:
                                            assignmentItem.questionLevel,
                                        completionRateParam:
                                            assignmentItem.completionRate,
                                        assignmentId: assignmentItem.id.toString(),
                                        qnTopic: assignmentItem.questionTopic,
                                      ),
                                    );
                                  }).divide(const SizedBox(height: 19.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      if (FFAppState().isLoading)
                        wrapWithModel(
                          model: _model.loadingModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const LoadingWidget(),
                        ),
                    ],
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 22.0)),
          ),
        ),
      ].divide(const SizedBox(height: 64.0)).addToStart(const SizedBox(height: 28.0)),
    );
  }
}
