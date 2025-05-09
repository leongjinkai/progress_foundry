import 'dart:collection';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:progress_foundry/components/generated_ans_field_widget.dart';
import 'package:progress_foundry/components/generated_c_o_field_widget.dart';
import 'package:progress_foundry/components/generated_qn_field_widget.dart';

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
import '/flutter_flow/custom_functions.dart' as functions;

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
  final Map<int,TextEditingController> controllers = HashMap.from({0: TextEditingController(), 1: TextEditingController()});
  Map<int,TextEditingController> ansControllers = {};
  Map<int,TextEditingController> firstAddControllers = {};
  Map<int,TextEditingController> secondAddControllers = {};
  Map<int,TextEditingController> coControllers = {};
  String complexQuestion = "";
  late KidWordProblemModel _model;
  String showFeedback = "";

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
        List<AssignmentResponseDTOStruct> unsortedQnList = StudentAssignmentStruct.maybeFromMap(
                (_model.responseQuestionList?.jsonBody ?? ''))!
            .assignmentQuestionResponseDTOList
            .toList()
            .cast<AssignmentResponseDTOStruct>();
        unsortedQnList.sort((a, b) => a.questionResponseDTO.id.compareTo(b.questionResponseDTO.id));
        FFAppState().newQuestionList = unsortedQnList;
        // Set ansList
        FFAppState().ansList = ["", ""];
        safeSetState(() {});
        // New Set Selected QN Detail
        FFAppState().newSelectedQnDetail = unsortedQnList.firstOrNull!.questionResponseDTO;
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
        FFAppState().secondaryAnsList = ["", ""];

        setState(() {
          complexQuestion = FFAppState().newQuestionList[0].questionResponseDTO.question;
        });
        safeSetState(() {});
        _model.timerController.onStartTimer();
        return;
      } else {
        return;
      }
    });

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
                                          questionItem.questionResponseDTO.id.toString(),
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
                            child: SingleChildScrollView(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 100.0),
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
                                                          FFAppState().newSelectedQnDetail.question,
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
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsetsDirectional
                                                      //           .fromSTEB(
                                                      //               0.0,
                                                      //               0.0,
                                                      //               0.0,
                                                      //               16.0),
                                                      //   child: Container(
                                                      //     width:
                                                      //         MediaQuery.sizeOf(
                                                      //                     context)
                                                      //                 .width *
                                                      //             1.0,
                                                      //     height: 600.0,
                                                      //     decoration:
                                                      //         BoxDecoration(
                                                      //       color: FlutterFlowTheme
                                                      //               .of(context)
                                                      //           .secondaryBackground,
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   20.0),
                                                      //       border: Border.all(
                                                      //         color: FlutterFlowTheme
                                                      //                 .of(context)
                                                      //             .primaryText,
                                                      //       ),
                                                      //     ),
                                                      //     child: Padding(
                                                      //       padding:
                                                      //           const EdgeInsets.all(
                                                      //               25.0),
                                                      //       child: Column(
                                                      //         mainAxisSize:
                                                      //             MainAxisSize
                                                      //                 .max,
                                                      //         children: [
                                                      //           Row(
                                                      //             mainAxisSize:
                                                      //                 MainAxisSize
                                                      //                     .max,
                                                      //             mainAxisAlignment:
                                                      //                 MainAxisAlignment
                                                      //                     .spaceBetween,
                                                      //             children: [
                                                      //               Text(
                                                      //                 'Draw your model here',
                                                      //                 style: FlutterFlowTheme.of(
                                                      //                         context)
                                                      //                     .bodyMedium
                                                      //                     .override(
                                                      //                       fontFamily:
                                                      //                           'Poppins',
                                                      //                       color:
                                                      //                           const Color(0xFF525F7F),
                                                      //                       fontSize:
                                                      //                           19.0,
                                                      //                       letterSpacing:
                                                      //                           0.0,
                                                      //                       fontWeight:
                                                      //                           FontWeight.w600,
                                                      //                       lineHeight:
                                                      //                           1.5,
                                                      //                     ),
                                                      //               ),
                                                      //             ],
                                                      //           ),
                                                      //           SizedBox(
                                                      //             width: MediaQuery.sizeOf(
                                                      //                         context)
                                                      //                     .width *
                                                      //                 1.0,
                                                      //             height: 500.0,
                                                      //             child: custom_widgets
                                                      //                 .DrawingCanvas(
                                                      //               width: MediaQuery.sizeOf(context)
                                                      //                       .width *
                                                      //                   1.0,
                                                      //               height:
                                                      //                   500.0,
                                                      //             ),
                                                      //           ),
                                                      //         ],
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
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
                                                                  child: Wrap(
                                                                    crossAxisAlignment: WrapCrossAlignment.center,
                                                                    spacing: 20,
                                                                    children: [
                                                                    const Text("Sally has"),
                                                                    GeneratedAnsFieldWidget(
                                                                      key: const Key(
                                                                        'Keyfh0_1',
                                                                      ),
                                                                      inputValue: FFAppState().secondaryAnsList.elementAtOrNull(0)!,
                                                                      idx: 0,
                                                                      textEditingController: controllers[0]!,
                                                                      ansControllers: controllers,
                                                                      updateFn: FFAppState().updateSecondaryAnsListAtIndex,
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<String>(
                                                                        functions.getOperatorFromTopic(FFAppState().newSelectedQnDetail.questionTopic)!,
                                                                        '?',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                            fontFamily: 'DM Sans',
                                                                            fontSize: 32.0,
                                                                            letterSpacing: 0.0,
                                                                            lineHeight: 1.5,
                                                                          ),
                                                                    ),
                                                                    GeneratedAnsFieldWidget(
                                                                      key: const Key(
                                                                        'Keyfh0_2',
                                                                      ),
                                                                      inputValue: FFAppState().secondaryAnsList.elementAtOrNull(1)!,
                                                                      idx: 0,
                                                                      textEditingController: controllers[1]!,
                                                                      ansControllers: controllers,
                                                                      updateFn: FFAppState().updateSecondaryAnsListAtIndex
                                                                    ),
                                                                    const Text("apples.")
                                                                    ],),
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
                                                          height: 400,
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
                                                                AdditionWorking(coControllers: coControllers, model: _model, ansControllers: ansControllers, firstAddControllers: firstAddControllers, secondAddControllers: secondAddControllers, safeSetState: safeSetState),
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

                                                                  List<String> qnPrompts = List<String>.from(FFAppState().newSelectedQnDetail.prompts);
                                                                  Map<String, int> mathSteps = {};
                                                                  List<int> answers = [0, 1, 2];
                                                                  qnPrompts.mapIndexed((int idx, String prompt) => mathSteps[prompt] = answers[idx]);

                                                                  // Call Attempt API
                                                                  _model.assignmentResponse =
                                                                      await LiveQuestionManagementGroup
                                                                          .attemptQuestionCall
                                                                          .call(
                                                                    questionId:
                                                                        FFAppState()
                                                                            .newSelectedQnDetail
                                                                            .id.toString(),
                                                                    answer: (List<
                                                                            String>
                                                                        ansList) {
                                                                      return ansList
                                                                          .join();
                                                                    }(FFAppState()
                                                                        .ansList
                                                                        .toList()),
                                                                    studentId: FFAppState()
                                                                        .MockStudent
                                                                        .studentId,
                                                                    assignmentId:
                                                                        widget
                                                                            .assignmentId,
                                                                    additionalDetailsJson: [AdditionalDetailObjectStruct(
                                                                                mathOperation: FFAppState().newSelectedQnDetail.questionType.toLowerCase(),
                                                                                mathSteps: [mathSteps]
                                                                              ).toMap()],
                                                                  );
                                      
                                                                  shouldSetState =
                                                                      true;
                                                                  bool isCorrect = StudentAssignmentStruct.maybeFromMap((_model
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
                                                                      .isCorrect;
                                                                  if (isCorrect) {
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
                                                                            title: const Text('Wrong Answer'),
                                                                            content: const Text("Try Again! You can do it!"),
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

                                                                  setState(() {
                                                                    showFeedback = StudentAssignmentStruct.maybeFromMap((_model.assignmentResponse?.jsonBody ?? ""))!.feedback;
                                                                  });
                                      
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
                                                                  } else if (FFAppState().selectedQuestion == FFAppState().newQuestionList.length) {
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
                                                                  
                                                                   else {
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
                                      Container(
                                        height: MediaQuery.sizeOf(context).height * 0.8,
                                        width: MediaQuery.sizeOf(context).width * 0.8,
                                        child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Positioned(
                                              right: 0,
                                              child: SizedBox(
                                                width: 240,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        if (showFeedback.isNotEmpty) {
                                                          return Align(
                                                            alignment: Alignment.bottomLeft,
                                                            // width: 240,
                                                            child: BubbleSpecialThree(
                                                              isSender: false,
                                                              text: showFeedback,
                                                              color: const Color(0xFFE8E8EE),
                                                              tail: true,
                                                              textStyle:  FlutterFlowTheme.of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: 'Poppins',
                                                                  color: const Color.fromARGB(255, 0, 0, 0),
                                                                  fontSize: 14.0,
                                                                  letterSpacing: 0.0,
                                                                  lineHeight: 1.5,
                                                                )
                                                            ),
                                                          );
                                                        } else {
                                                          return Container();
                                                        }
                                                    }),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(8.0),
                                                      child: Image.asset(
                                                        'assets/images/Stand_up_2.gif',
                                                        width: 183.0,
                                                        height: 183.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
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

class AdditionWorking extends StatelessWidget {
  const AdditionWorking({
    super.key,
    required this.coControllers,
    required KidWordProblemModel model,
    required this.ansControllers,
    required this.firstAddControllers,
    required this.secondAddControllers,
    required this.safeSetState
  }) : _model = model;

  final Map<int, TextEditingController> coControllers;
  final KidWordProblemModel _model;
  final Map<int, TextEditingController> ansControllers;
  final Map<int, TextEditingController> firstAddControllers;
  final Map<int, TextEditingController> secondAddControllers;
  final Function(Function()) safeSetState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100.0,
        decoration:
            BoxDecoration(
          color: FlutterFlowTheme.of(
                  context)
              .secondaryBackground,
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize
                  .min,
          children: [
            Column(
              mainAxisSize:
                  MainAxisSize
                      .max,
              mainAxisAlignment:
                  MainAxisAlignment
                      .start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height:
                      145.0,
                  decoration:
                      BoxDecoration(
                    color:
                        FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child:
                      Row(
                    mainAxisSize:
                        MainAxisSize.max,
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children:
                        [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.4),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                          child: Text(
                            valueOrDefault<String>(
                              functions.getOperatorFromTopic(FFAppState().newSelectedQnDetail.questionTopic)!,
                              '?',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'DM Sans',
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final numCarryOver = [""];
                                                        
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: List.generate(numCarryOver.length, (numCarryOverIndex) {
                                        var controller = coControllers.putIfAbsent(numCarryOverIndex, () => TextEditingController());
                                        return wrapWithModel(
                                          model: _model.generatedCOFieldModels.getModel(
                                            numCarryOverIndex.toString(),
                                            numCarryOverIndex,
                                          ),
                                          updateCallback: () => safeSetState(() {}),
                                          child: GeneratedCOFieldWidget(
                                            key: Key('Keyrrx_${numCarryOverIndex}_of_${numCarryOver.length}'),
                                            inputChar: '?',
                                            ansId: numCarryOverIndex,
                                            controller: controller
    
                                          ),
                                        );
                                      }).divide(const SizedBox(width: 8.0)),
                                    );
                                  },
                                ),
                              ),
                              AddSubFirstQnFields(model: _model, safeSetState: safeSetState, controllers: firstAddControllers),
                              AddSubSecondQnFields(model: _model, safeSetState: safeSetState, controllers: secondAddControllers)
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 28.0)),
                  ),
                ),
                Divider(
                  thickness:
                      1.0,
                  color:
                      FlutterFlowTheme.of(context).primaryText,
                ),
              ],
            ),
            AddSubAnsFields(model: _model, safeSetState: safeSetState, controllers: ansControllers),
          ].divide(const SizedBox(
              height:
                  17.0)),
        ),
      ),
    );
  }
}

class AddSubAnsFields extends StatefulWidget {
  const AddSubAnsFields({
    super.key,
    required KidWordProblemModel model,
    required this.safeSetState,
    required this.controllers,
  }) : _model = model;

  final KidWordProblemModel _model;
  final Function(Function()) safeSetState; 
  final Map<int,TextEditingController> controllers;

  @override
  createState() => AddSubAnsFieldsState();

}

class AddSubAnsFieldsState extends State<AddSubAnsFields> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:
          (context) {
        final numAnswers = ["", ""];
                                                
        return Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                numAnswers.length,
                (numAnswersIndex) {
              var controller = widget.controllers.putIfAbsent(
                      numAnswersIndex, () => TextEditingController());
              return wrapWithModel(
                model: widget._model.generatedAnsFieldModels.getModel(
                  numAnswersIndex.toString(),
                  numAnswersIndex,
                ),
                updateCallback: () => safeSetState(() {}),
                child: GeneratedAnsFieldWidget(
                  key: Key(
                    'Keyfh0_${numAnswersIndex.toString()}',
                  ),
                  inputValue: FFAppState().ansList.elementAtOrNull(numAnswersIndex)!,
                  idx: numAnswersIndex,
                  textEditingController: controller,
                  ansControllers: widget.controllers,
                  updateFn: FFAppState().updateAnsListAtIndex,
                ),
                updateOnChange: true,
              );
            }).divide(
                const SizedBox(width: 8.0)),
          ),
        );
      },
    );
  }
}

class AddSubFirstQnFields extends StatefulWidget {
  const AddSubFirstQnFields({
    super.key,
    required KidWordProblemModel model,
    required this.safeSetState,
    required this.controllers,
  }) : _model = model;

  final KidWordProblemModel _model;
  final Function(Function()) safeSetState; 
  final Map<int,TextEditingController> controllers;

  @override
  createState() => AddSubFirstQnFieldsState();

}

class AddSubFirstQnFieldsState extends State<AddSubFirstQnFields> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:
          (context) {
        final numAnswers = ["", ""];
                                                
        return Row(
          mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              numAnswers.length,
              (numAnswersIndex) {
            var controller = widget.controllers.putIfAbsent(
                    numAnswersIndex, () => TextEditingController());
            return wrapWithModel(
              model: widget._model.generatedAnsFieldModels.getModel(
                numAnswersIndex.toString(),
                numAnswersIndex,
              ),
              updateCallback: () => safeSetState(() {}),
              child: GeneratedAnsFieldWidget(
                key: Key(
                  'Keyfj0_${numAnswersIndex.toString()}',
                ),
                inputValue: FFAppState().ansList.elementAtOrNull(numAnswersIndex)!,
                idx: numAnswersIndex,
                textEditingController: controller,
                ansControllers: widget.controllers,
                updateFn: FFAppState().updateAnsListAtIndex,
              ),
              updateOnChange: true,
            );
          }).divide(
              const SizedBox(width: 8.0)),
        );
      },
    );
  }
}

class AddSubSecondQnFields extends StatefulWidget {
  const AddSubSecondQnFields({
    super.key,
    required KidWordProblemModel model,
    required this.safeSetState,
    required this.controllers,
  }) : _model = model;

  final KidWordProblemModel _model;
  final Function(Function()) safeSetState; 
  final Map<int,TextEditingController> controllers;

  @override
  createState() => AddSubSecondQnFieldsState();

}

class AddSubSecondQnFieldsState extends State<AddSubSecondQnFields> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:
          (context) {
        final numAnswers = ["", ""];
                                                
        return Row(
          mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              numAnswers.length,
              (numAnswersIndex) {
            var controller = widget.controllers.putIfAbsent(
                    numAnswersIndex, () => TextEditingController());
            return wrapWithModel(
              model: widget._model.generatedAnsFieldModels.getModel(
                numAnswersIndex.toString(),
                numAnswersIndex,
              ),
              updateCallback: () => safeSetState(() {}),
              child: GeneratedAnsFieldWidget(
                key: Key(
                  'Keyfi0_${numAnswersIndex.toString()}',
                ),
                inputValue: FFAppState().ansList.elementAtOrNull(numAnswersIndex)!,
                idx: numAnswersIndex,
                textEditingController: controller,
                ansControllers: widget.controllers,
                updateFn: FFAppState().updateAnsListAtIndex,
              ),
              updateOnChange: true,
            );
          }).divide(
              const SizedBox(width: 8.0)),
        );
      },
    );
  }
}