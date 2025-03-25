import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/generated_ans_field_widget.dart';
import '/components/generated_c_o_field_widget.dart';
import '/components/generated_qn_field_widget.dart';
import '/components/question_bubble_new_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'kid_divison_model.dart';
export 'kid_divison_model.dart';

class KidDivisonWidget extends StatefulWidget {
  const KidDivisonWidget({
    super.key,
    required this.assignmentId,
  });

  final String? assignmentId;

  @override
  State<KidDivisonWidget> createState() => _KidDivisonWidgetState();
}

class _KidDivisonWidgetState extends State<KidDivisonWidget> {
  late KidDivisonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<int,TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidDivisonModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = true;
      // Get Question List
      _model.responseQuestionList =
          await LiveQuestionManagementGroup.getSpecificAssignmentCall.call(
        assignmentId: widget.assignmentId,
        authToken: currentJwtToken,
      );

      if (StudentAssignmentStruct.maybeFromMap(
              (_model.responseQuestionList?.jsonBody ?? ''))!
          .assignmentQuestionResponseDTOList
          .isNotEmpty) {
        // New Set Selected QN Detail
        _model.newSelectedQnDetail = StudentAssignmentStruct.maybeFromMap(
                (_model.responseQuestionList?.jsonBody ?? ''))
            ?.assignmentQuestionResponseDTOList
            .firstOrNull
            ?.questionResponseDTO;
        // Set Loading False
        FFAppState().isLoading = false;
        safeSetState(() {});
        _model.divisionQnList = StudentAssignmentStruct.maybeFromMap(
                (_model.responseQuestionList?.jsonBody ?? ''))!
            .assignmentQuestionResponseDTOList
            .toList()
            .cast<AssignmentResponseDTOStruct>();
        safeSetState(() {});
        _model.timerController.onStartTimer();
        return;
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('API Failed'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
    });

    _model.unknownAnswerTextController ??= TextEditingController();
    _model.unknownAnswerFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.unknownAnswerTextController?.text = '?';
        }));
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
                        child: Visibility(
                          visible: !FFAppState().isLoading,
                          child: Builder(
                            builder: (context) {
                              final question = _model.divisionQnList
                                  .map((e) => e)
                                  .toList()
                                  .take(10)
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
                                  final questionItem = question[questionIndex];
                                  return QuestionBubbleNewWidget(
                                    key: Key(
                                        'Keybze_${questionIndex}_of_${question.length}'),
                                    questionNumber: questionIndex + 1,
                                    questionAttempt: questionItem,
                                  );
                                },
                              );
                            },
                          ),
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
                            valueOrDefault<String>(
                              functions.getAssigmentCardContentHeader(
                                  StudentAssignmentStruct.maybeFromMap((_model
                                              .responseQuestionList?.jsonBody ??
                                          ''))!
                                      .questionTopic,
                                  StudentAssignmentStruct.maybeFromMap((_model
                                              .responseQuestionList?.jsonBody ??
                                          ''))!
                                      .questionLevel),
                              '?',
                            ),
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
                            child: Visibility(
                              visible: !FFAppState().isLoading,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    38.0, 38.0, 38.0, 38.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                          initialTime:
                                              _model.timerInitialTimeMs,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval:
                                              const Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate) {
                                              safeSetState(() {});
                                            }
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 62.0),
                                      child: Text(
                                        'Question ${_model.divisionSelectedQn?.toString()}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 33.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            115.0, 0.0, 115.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 95.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      _model.newSelectedQnDetail
                                                          ?.question,
                                                      'x divide x =',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          fontSize: 33.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 41.0,
                                                    height: 41.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: SizedBox(
                                                        width: 41.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .unknownAnswerTextController,
                                                          focusNode: _model
                                                              .unknownAnswerFocusNode,
                                                          autofocus: true,
                                                          readOnly: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                width: 0.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 0.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 0.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 0.5,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          validator: _model
                                                              .unknownAnswerTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 11.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 30.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            41.0,
                                                                        height:
                                                                            41.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          (String
                                                                              qnParam) {
                                                                            return qnParam.split(" ")[2];
                                                                          }(_model
                                                                              .newSelectedQnDetail!
                                                                              .question),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Text(
                                                                        '-',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              fontSize: 32.0,
                                                                              letterSpacing: 0.0,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          15.0)),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.14,
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
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            35.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children:
                                                                              [
                                                                            // wrapWithModel(
                                                                            //   model: _model.generatedCOFieldModel,
                                                                            //   updateCallback: () => safeSetState(() {}),
                                                                            //   child: const GeneratedCOFieldWidget(
                                                                            //     inputChar: '?',
                                                                            //     ansId: 1,
                                                                            //     controller: controller
                                                                            //   ),
                                                                            // ),
                                                                            Container()
                                                                          ].addToEnd(const SizedBox(width: 25.0)),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              () {
                                                                            if (functions.getDivisonAnsLength(_model.newSelectedQnDetail!.questionLevel).length ==
                                                                                1) {
                                                                              return 60.0;
                                                                            } else if (functions.getDivisonAnsLength(_model.newSelectedQnDetail!.questionLevel).length ==
                                                                                2) {
                                                                              return 110.0;
                                                                            } else if (functions.getDivisonAnsLength(_model.newSelectedQnDetail!.questionLevel).length ==
                                                                                3) {
                                                                              return 160.0;
                                                                            } else {
                                                                              return 210.0;
                                                                            }
                                                                          }(),
                                                                          height:
                                                                              70.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                offset: const Offset(
                                                                                  -2.0,
                                                                                  -1.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final firstNumChar = functions.getFirstNumList(_model.newSelectedQnDetail!.question).toList().take(4).toList();
                                                                                if (firstNumChar.isEmpty) {
                                                                                  return SvgPicture.asset(
                                                                                    'assets/images/assignment_icon.svg',
                                                                                  );
                                                                                }

                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: List.generate(firstNumChar.length, (firstNumCharIndex) {
                                                                                    final firstNumCharItem = firstNumChar[firstNumCharIndex];
                                                                                    return GeneratedQnFieldWidget(
                                                                                      key: Key('Keyrx4_${firstNumCharIndex}_of_${firstNumChar.length}'),
                                                                                      inputChar: firstNumCharItem,
                                                                                    );
                                                                                  }).divide(const SizedBox(width: 8.0)),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final dividendLength = functions
                                                                              .getDivisonAnsLength(_model.newSelectedQnDetail!.questionLevel)
                                                                              .toList()
                                                                              .take(4)
                                                                              .toList();
                                                                          if (dividendLength
                                                                              .isEmpty) {
                                                                            return SvgPicture.asset(
                                                                              'assets/images/practice_icon.svg',
                                                                            );
                                                                          }

                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                List.generate(dividendLength.length, (dividendLengthIndex) {
                                                                              final dividendLengthItem = dividendLength[dividendLengthIndex];
                                                                              var controller = controllers.putIfAbsent(dividendLengthIndex, () => TextEditingController());
                                                                              return wrapWithModel(
                                                                                model: _model.generatedAnsFieldModels1.getModel(
                                                                                  dividendLengthIndex.toString(),
                                                                                  dividendLengthIndex,
                                                                                ),
                                                                                updateCallback: () => safeSetState(() {}),
                                                                                child: GeneratedAnsFieldWidget(
                                                                                  key: Key(
                                                                                    'Keyiro_${dividendLengthIndex.toString()}',
                                                                                  ),
                                                                                  inputValue: FFAppState().ansList.elementAtOrNull(dividendLengthIndex)!,
                                                                                  idx: dividendLengthIndex,
                                                                                  textEditingController: controller
                                                                                ),
                                                                              );
                                                                            }).divide(const SizedBox(width: 8.0)),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 28.0)),
                                                            ),
                                                          ),
                                                          Divider(
                                                            height: 15.0,
                                                            thickness: 1.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              final numAnswers = functions
                                                                  .getDivisonAnsLength(_model
                                                                      .newSelectedQnDetail!
                                                                      .questionLevel)
                                                                  .toList()
                                                                  .take(4)
                                                                  .toList();

                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: List.generate(
                                                                    numAnswers
                                                                        .length,
                                                                    (numAnswersIndex) {
                                                                  final numAnswersItem =
                                                                      numAnswers[
                                                                          numAnswersIndex];
                                                                  var controller = controllers.putIfAbsent(numAnswersIndex, () => TextEditingController());
                                                                  return wrapWithModel(
                                                                    model: _model
                                                                        .generatedAnsFieldModels2
                                                                        .getModel(
                                                                      numAnswersIndex
                                                                          .toString(),
                                                                      numAnswersIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        GeneratedAnsFieldWidget(
                                                                      key: Key(
                                                                        'Key7k1_${numAnswersIndex.toString()}',
                                                                      ),
                                                                      inputValue: FFAppState()
                                                                          .ansList
                                                                          .elementAtOrNull(
                                                                              numAnswersIndex)!,
                                                                      idx:
                                                                          numAnswersIndex,
                                                                          textEditingController: controller,
                                                                    ),
                                                                  );
                                                                }).divide(
                                                                    const SizedBox(
                                                                        width:
                                                                            8.0)),
                                                              );
                                                            },
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final numAnswers = functions
                                                                  .getDivisonAnsLength(_model
                                                                      .newSelectedQnDetail!
                                                                      .questionLevel)
                                                                  .toList()
                                                                  .take(4)
                                                                  .toList();

                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: List.generate(
                                                                    numAnswers
                                                                        .length,
                                                                    (numAnswersIndex) {
                                                                  final numAnswersItem =
                                                                      numAnswers[
                                                                          numAnswersIndex];
                                                                  var controller = controllers.putIfAbsent(numAnswersIndex, () => TextEditingController());
                                                                  return wrapWithModel(
                                                                    model: _model
                                                                        .generatedAnsFieldModels3
                                                                        .getModel(
                                                                      numAnswersIndex
                                                                          .toString(),
                                                                      numAnswersIndex,
                                                                    ),
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        GeneratedAnsFieldWidget(
                                                                      key: Key(
                                                                        'Keyxq5_${numAnswersIndex.toString()}',
                                                                      ),
                                                                      inputValue: FFAppState()
                                                                          .ansList
                                                                          .elementAtOrNull(
                                                                              numAnswersIndex)!,
                                                                      idx:
                                                                          numAnswersIndex,
                                                                          textEditingController: controller,
                                                                    ),
                                                                  );
                                                                }).divide(
                                                                    const SizedBox(
                                                                        width:
                                                                            8.0)),
                                                              );
                                                            },
                                                          ),
                                                          Divider(
                                                            height: 15.0,
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final numAnswers = functions
                                                            .getDivisonAnsLength(_model
                                                                .newSelectedQnDetail!
                                                                .questionLevel)
                                                            .toList()
                                                            .take(4)
                                                            .toList();

                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: List.generate(
                                                              numAnswers.length,
                                                              (numAnswersIndex) {
                                                            final numAnswersItem =
                                                                numAnswers[
                                                                    numAnswersIndex];
                                                            var controller = controllers.putIfAbsent(numAnswersIndex, () => TextEditingController());

                                                            return wrapWithModel(
                                                              model: _model
                                                                  .generatedAnsFieldModels4
                                                                  .getModel(
                                                                numAnswersIndex
                                                                    .toString(),
                                                                numAnswersIndex,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  GeneratedAnsFieldWidget(
                                                                key: Key(
                                                                  'Keynwz_${numAnswersIndex.toString()}',
                                                                ),
                                                                inputValue: FFAppState()
                                                                    .ansList
                                                                    .elementAtOrNull(
                                                                        numAnswersIndex)!,
                                                                idx:
                                                                    numAnswersIndex,
                                                                    textEditingController: controller,
                                                              ),

                                                            );
                                                          }).divide(const SizedBox(
                                                              width: 8.0)),
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (FFAppState()
                                                        .selectedQuestion >
                                                    1)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 6.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: '< Back',
                                                      options: FFButtonOptions(
                                                        width: 136.0,
                                                        height: 38.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'DM Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 6.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var shouldSetState =
                                                          false;
                                                      // Call Attempt API
                                                      _model.assignmentResponse =
                                                          await LiveQuestionManagementGroup
                                                              .attemptQuestionCall
                                                              .call(
                                                        questionId: FFAppState()
                                                            .newSelectedQnDetail
                                                            .id.toString(),
                                                        answer: (List<String>
                                                            ansList) {
                                                          return ansList
                                                              .join()
                                                              .replaceAll(
                                                                  "a", "");
                                                        }(FFAppState()
                                                            .ansList
                                                            .toList()),
                                                        studentId: FFAppState()
                                                            .MockStudent
                                                            .studentId,
                                                        assignmentId: widget
                                                            .assignmentId,
                                                      );

                                                      shouldSetState = true;
                                                      if (StudentAssignmentStruct
                                                              .maybeFromMap((_model
                                                                      .assignmentResponse
                                                                      ?.jsonBody ??
                                                                  ''))!
                                                          .assignmentQuestionResponseDTOList
                                                          .isNotEmpty) {
                                                        // Correct Answer
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Correct'),
                                                              content: Text(
                                                                  'You have completed the qn in: ${_model.timerValue}'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        // Wrong answer
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  const Text('Wrong'),
                                                              content: Text(
                                                                  (List<String>
                                                                      var1) {
                                                                return var1
                                                                    .join("");
                                                              }(FFAppState()
                                                                      .ansList
                                                                      .toList())),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }

                                                      if (StudentAssignmentStruct
                                                                  .maybeFromMap((_model
                                                                          .assignmentResponse
                                                                          ?.jsonBody ??
                                                                      ''))
                                                              ?.completionRate ==
                                                          1.0) {
                                                        context.pushNamed(
                                                            'KidsPerfect');

                                                        // Remove Ans Length
                                                        FFAppState().ansLength =
                                                            [];
                                                        safeSetState(() {});
                                                        // Reset Answer Input
                                                        FFAppState().ansList = [
                                                          "",
                                                          "",
                                                          "",
                                                          ""
                                                        ]
                                                            .toList()
                                                            .cast<String>();
                                                        FFAppState()
                                                            .update(() {});
                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      } else {
                                                        // Next Question
                                                        _model.divisionSelectedQn =
                                                            _model.divisionSelectedQn! +
                                                                1;
                                                        safeSetState(() {});
                                                        // Set QnList to update correct/wrong answers
                                                        _model
                                                            .divisionQnList = StudentAssignmentStruct
                                                                .maybeFromMap((_model
                                                                        .assignmentResponse
                                                                        ?.jsonBody ??
                                                                    ''))!
                                                            .assignmentQuestionResponseDTOList
                                                            .toList()
                                                            .cast<
                                                                AssignmentResponseDTOStruct>();
                                                        safeSetState(() {});
                                                      }

                                                      // Clear ansList
                                                      FFAppState().ansList = [];
                                                      _model.updatePage(() {});
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  100));
                                                      // Reset Answer Input
                                                      FFAppState().ansList = [
                                                        "",
                                                        "",
                                                        "",
                                                        ""
                                                      ].toList().cast<String>();
                                                      FFAppState()
                                                          .update(() {});
                                                      // Set Next Question Detail
                                                      _model
                                                          .newSelectedQnDetail = (StudentAssignmentStruct
                                                                  .maybeFromMap((_model
                                                                          .responseQuestionList
                                                                          ?.jsonBody ??
                                                                      ''))
                                                              ?.assignmentQuestionResponseDTOList
                                                              .elementAtOrNull(
                                                                  (_model.divisionSelectedQn!) -
                                                                      1))
                                                          ?.questionResponseDTO;
                                                      safeSetState(() {});
                                                      // Reset Timer
                                                      _model.timerController
                                                          .onResetTimer();

                                                      // Start Timer
                                                      _model.timerController
                                                          .onStartTimer();
                                                      if (shouldSetState) {
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    text: 'Next >',
                                                    options: FFButtonOptions(
                                                      width: 136.0,
                                                      height: 38.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
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
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 15.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
