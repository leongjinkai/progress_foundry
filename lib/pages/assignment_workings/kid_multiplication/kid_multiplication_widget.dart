import '/components/multiply_entry_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'kid_multiplication_model.dart';
export 'kid_multiplication_model.dart';

class KidMultiplicationWidget extends StatefulWidget {
  const KidMultiplicationWidget({super.key});

  @override
  State<KidMultiplicationWidget> createState() =>
      _KidMultiplicationWidgetState();
}

class _KidMultiplicationWidgetState extends State<KidMultiplicationWidget> {
  late KidMultiplicationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidMultiplicationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        width: 256.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF81E770),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                          Text(
                                            'Correct answer',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFF9B9B9B),
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE0ECFF),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: const Color(0xFF0266FF),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 3',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 4',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 5',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 6',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 7',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 8',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 9',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 66.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color: const Color(0xFFACCDFF),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '1',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: const Color(0xFFACCDFF),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Question 10',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 11.0)),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 5.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: 1181.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Single Digit Multiplication',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: const Color(0xFF486284),
                                  fontSize: 40.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.5,
                                ),
                          ),
                          Container(
                            width: 600.0,
                            height: 762.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFFACCDFF),
                                  offset: Offset(
                                    10.0,
                                    -10.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: const Color(0xFFACCDFF),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  38.0, 38.0, 38.0, 38.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Text(
                                          'Timer',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                      FlutterFlowTimer(
                                        initialTime: _model.timerInitialTimeMs,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            const Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) safeSetState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 23.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ].divide(const SizedBox(width: 5.0)),
                                  ),
                                  Container(
                                    width: 232.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final increment =
                                            _model.incrementInt.toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(increment.length,
                                                  (incrementIndex) {
                                            final incrementItem =
                                                increment[incrementIndex];
                                            return MultiplyEntryWidget(
                                              key: Key(
                                                  'Key4v5_${incrementIndex}_of_${increment.length}'),
                                              parameter1: incrementItem,
                                            );
                                          }).divide(const SizedBox(height: 14.0)),
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 40.0)),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 19.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
