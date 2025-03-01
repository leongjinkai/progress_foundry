import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_widget.dart';
import '/components/question_bubble_new_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'kid_word_problem_model.dart';
export 'kid_word_problem_model.dart';

class KidWordProblemWidget extends StatefulWidget {
  const KidWordProblemWidget({
    super.key,
    required this.assignmentId,
  });

  final String? assignmentId;

  @override
  State<KidWordProblemWidget> createState() => _KidWordProblemWidgetState();
}

class _KidWordProblemWidgetState extends State<KidWordProblemWidget> {
  late KidWordProblemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidWordProblemModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = true;
      // Get Question List
      _model.responseQuestionList =
          await LiveQuestionManagementGroup.getSpecificAssignmentCall.call(
        assignmentId: widget.assignmentId,
      );

      if (StudentAssignmentStruct.maybeFromMap(
              (_model.responseQuestionList?.jsonBody ?? ''))!
          .assignmentQuestionResponseDTOList
          .isNotEmpty) {
        // New Set Selected QN Detail
        FFAppState().newSelectedQnDetail = StudentAssignmentStruct.maybeFromMap(
                (_model.responseQuestionList?.jsonBody ?? ''))!
            .assignmentQuestionResponseDTOList
            .firstOrNull!
            .questionResponseDTO;
        safeSetState(() {});
        // Set Loading False
        FFAppState().isLoading = false;
        safeSetState(() {});
        FFAppState().newQuestionList = StudentAssignmentStruct.maybeFromMap(
                (_model.responseQuestionList?.jsonBody ?? ''))!
            .assignmentQuestionResponseDTOList
            .toList()
            .cast<AssignmentResponseDTOStruct>();
        safeSetState(() {});
        _model.timerController.onStartTimer();
        return;
      } else {
        return;
      }
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
    context.watch<FFAppState>();

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
          child: Stack(
            children: [
              if (!FFAppState().isLoading)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.sizeOf(context).width * 1.0,
                        maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 256.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            constraints: const BoxConstraints(
                              minWidth: 256.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                width: 1.0,
                              ),
                            ),
                            child: Visibility(
                              visible: !FFAppState().isLoading,
                              child: Builder(
                                builder: (context) {
                                  final question = FFAppState()
                                      .newQuestionList
                                      .map((e) => e)
                                      .toList();
                                  if (question.isEmpty) {
                                    return SvgPicture.asset(
                                      'assets/images/setting_icon.svg',
                                    );
                                  }

                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      104.0,
                                      0,
                                      0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: question.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 5.0),
                                    itemBuilder: (context, questionIndex) {
                                      final questionItem =
                                          question[questionIndex];
                                      return wrapWithModel(
                                        model: _model.questionBubbleNewModels
                                            .getModel(
                                          questionItem.questionResponseDTO.id,
                                          questionIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: QuestionBubbleNewWidget(
                                          key: Key(
                                            'Keyrta_${questionItem.questionResponseDTO.id}',
                                          ),
                                          questionNumber: questionIndex + 1,
                                          questionAttempt: questionItem,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: Stack(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    if (FFAppState().bgImg == 'bgOne')
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/bg_one.png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().bgImg == 'bgTwo')
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/bg_two.png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                    if (FFAppState().bgImg == 'bgThree')
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/bg_three.png',
                                            ).image,
                                          ),
                                        ),
                                      ),
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 100.0, 0.0, 100.0),
                                            child: Container(
                                              width: 800.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: const Color(0xFFACCDFF),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible:
                                                    !FFAppState().isLoading,
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(38.0, 38.0,
                                                          38.0, 38.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        2.0),
                                                            child: Text(
                                                              'Timer',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'DM Sans',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ),
                                                          FlutterFlowTimer(
                                                            initialTime: _model
                                                                .timerInitialTimeMs,
                                                            getDisplayTime: (value) =>
                                                                StopWatchTimer
                                                                    .getDisplayTime(
                                                              value,
                                                              hours: false,
                                                              milliSecond:
                                                                  false,
                                                            ),
                                                            controller: _model
                                                                .timerController,
                                                            updateStateInterval:
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000),
                                                            onChanged: (value,
                                                                displayTime,
                                                                shouldUpdate) {
                                                              _model.timerMilliseconds =
                                                                  value;
                                                              _model.timerValue =
                                                                  displayTime;
                                                              if (shouldUpdate) {
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      23.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 5.0)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    23.0),
                                                        child: Text(
                                                          'Question ${FFAppState().selectedQuestion.toString()}',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 33.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    50.0),
                                                        child: Text(
                                                          'John and Keith had an equal number of marbles at first.  After John gave away 54 marbles and Keith gave away 18 marbles, the ratio of John’s marbles to Keith’s marbles was 3:4.  How many marbles did John have at first?',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 600.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    25.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Draw your model here',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                const Color(0xFF525F7F),
                                                                            fontSize:
                                                                                19.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 500.0,
                                                                  child: custom_widgets
                                                                      .DrawingCanvas(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        500.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  3.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    25.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Write number statement here',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: const Color(
                                                                            0xFF525F7F),
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height:
                                                                      20.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  3.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    25.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Do working here',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: const Color(
                                                                            0xFF525F7F),
                                                                        fontSize:
                                                                            19.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height:
                                                                      20.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (FFAppState()
                                                                  .selectedQuestion >
                                                              1)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  // Minus 1 to selectedQn
                                                                  FFAppState()
                                                                          .selectedQuestion =
                                                                      FFAppState()
                                                                              .selectedQuestion +
                                                                          -1;
                                                                  safeSetState(
                                                                      () {});
                                                                  // Change qn detail
                                                                  FFAppState().newSelectedQnDetail = FFAppState()
                                                                      .newQuestionList
                                                                      .elementAtOrNull(
                                                                          FFAppState().selectedQuestion +
                                                                              1)!
                                                                      .questionResponseDTO;
                                                                  safeSetState(
                                                                      () {});
                                                                  // Clear ansList
                                                                  FFAppState()
                                                                      .ansList = [];
                                                                  _model
                                                                      .updatePage(
                                                                          () {});
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              100));
                                                                  // Reset Answer Input
                                                                  FFAppState()
                                                                      .ansList = [
                                                                    "",
                                                                    "",
                                                                    "",
                                                                    ""
                                                                  ].toList().cast<
                                                                      String>();
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  _model
                                                                      .timerController
                                                                      .onResetTimer();

                                                                  _model
                                                                      .timerController
                                                                      .onStartTimer();
                                                                },
                                                                text: '< Back',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 136.0,
                                                                  height: 38.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'DM Sans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          if (FFAppState()
                                                                  .selectedQuestion <
                                                              (StudentAssignmentStruct.maybeFromMap((_model
                                                                              .responseQuestionList
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                      .assignmentQuestionResponseDTOList
                                                                      .length +
                                                                  1))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  var shouldSetState =
                                                                      false;
                                                                  // Call Attempt API
                                                                  _model.assignmentResponse =
                                                                      await LiveQuestionManagementGroup
                                                                          .attemptQuestionCall
                                                                          .call(
                                                                    questionId:
                                                                        FFAppState()
                                                                            .newSelectedQnDetail
                                                                            .id,
                                                                    answer: (List<
                                                                            String>
                                                                        ansList) {
                                                                      return ansList
                                                                          .join()
                                                                          .replaceAll(
                                                                              "a",
                                                                              "");
                                                                    }(FFAppState()
                                                                        .ansList
                                                                        .toList()),
                                                                    studentId: FFAppState()
                                                                        .MockStudent
                                                                        .studentId,
                                                                    assignmentId:
                                                                        widget
                                                                            .assignmentId,
                                                                  );

                                                                  shouldSetState =
                                                                      true;
                                                                  if (StudentAssignmentStruct.maybeFromMap((_model
                                                                              .assignmentResponse
                                                                              ?.jsonBody ??
                                                                          ''))!
                                                                      .assignmentQuestionResponseDTOList
                                                                      .where((e) =>
                                                                          e.questionResponseDTO
                                                                              .id ==
                                                                          FFAppState()
                                                                              .newSelectedQnDetail
                                                                              .id)
                                                                      .toList()
                                                                      .firstOrNull!
                                                                      .normalQuestionAttemptResponseDTO
                                                                      .isCorrect) {
                                                                    // Correct Answer
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Correct'),
                                                                          content:
                                                                              Text('You have completed the qn in: ${_model.timerValue}'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  } else {
                                                                    // Wrong answer
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Wrong'),
                                                                          content: Text((List<String>
                                                                              var1) {
                                                                            return var1.join("");
                                                                          }(FFAppState()
                                                                              .ansList
                                                                              .toList())),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }

                                                                  if (StudentAssignmentStruct.maybeFromMap((_model.assignmentResponse?.jsonBody ??
                                                                              ''))
                                                                          ?.completionRate ==
                                                                      1.0) {
                                                                    context.pushNamed(
                                                                        'KidsPerfect');

                                                                    // Remove Ans Length
                                                                    FFAppState()
                                                                        .ansLength = [];
                                                                    safeSetState(
                                                                        () {});
                                                                    // Reset Answer Input
                                                                    FFAppState()
                                                                        .ansList = [
                                                                      "",
                                                                      "",
                                                                      "",
                                                                      ""
                                                                    ].toList().cast<
                                                                        String>();
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                    if (shouldSetState) {
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  } else {
                                                                    // Next Question
                                                                    FFAppState()
                                                                            .selectedQuestion =
                                                                        FFAppState().selectedQuestion +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                    // Set QnList to update correct/wrong answers
                                                                    FFAppState()
                                                                        .newQuestionList = StudentAssignmentStruct.maybeFromMap((_model.assignmentResponse?.jsonBody ??
                                                                            ''))!
                                                                        .assignmentQuestionResponseDTOList
                                                                        .toList()
                                                                        .cast<
                                                                            AssignmentResponseDTOStruct>();
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  // Clear ansList
                                                                  FFAppState()
                                                                      .ansList = [];
                                                                  _model
                                                                      .updatePage(
                                                                          () {});
                                                                  await Future.delayed(
                                                                      const Duration(
                                                                          milliseconds:
                                                                              100));
                                                                  // Reset Answer Input
                                                                  FFAppState()
                                                                      .ansList = [
                                                                    "",
                                                                    "",
                                                                    "",
                                                                    ""
                                                                  ].toList().cast<
                                                                      String>();
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  // Set Next Question Detail
                                                                  FFAppState()
                                                                          .newSelectedQnDetail =
                                                                      FFAppState()
                                                                          .newSelectedQnDetail;
                                                                  safeSetState(
                                                                      () {});
                                                                  // Reset Timer
                                                                  _model
                                                                      .timerController
                                                                      .onResetTimer();

                                                                  // Start Timer
                                                                  _model
                                                                      .timerController
                                                                      .onStartTimer();
                                                                  if (shouldSetState) {
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                },
                                                                text: 'Next >',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 136.0,
                                                                  height: 38.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'DM Sans',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                        ].divide(const SizedBox(
                                                            width: 15.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
    );
  }
}
