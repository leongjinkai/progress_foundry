import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:progress_foundry/flutter_flow/custom_functions.dart';

import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/generated_ans_field_widget.dart';
import '/components/generated_c_o_field_widget.dart';
import '/components/generated_qn_field_widget.dart';
import '/components/loading_widget.dart';
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
import 'kid_addition_model.dart';
export 'kid_addition_model.dart';

class KidAdditionWidget extends StatefulWidget {
  const KidAdditionWidget({
    super.key,
    required this.assignmentId,
  });

  final String? assignmentId;

  @override
  State<KidAdditionWidget> createState() => _KidAdditionWidgetState();
}

class _KidAdditionWidgetState extends State<KidAdditionWidget> {
  late KidAdditionModel _model;
  String showFeedback = "";
  final _formKey = GlobalKey<FormState>();
  Map<int,TextEditingController> ansControllers = {};
  Map<int,TextEditingController> coControllers = {};

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, String> headerTitles =
  {
    "ADDITION - SINGLE_DIGIT": "Adding to 10",
    "ADDITION - DOUBLE_DIGIT": "Adding to 100",
    "SUBTRACTION - SINGLE_DIGIT": "Subtracting to 10",
    "SUBTRACTION - DOUBLE_DIGIT": "Subtracting to 100"
  };
  String questionCatAndLevel = "";

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidAdditionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isLoading = true;
      // Get Question List
      _model.responseQuestionList =
          await LiveQuestionManagementGroup.getSpecificAssignmentCall.call(
        assignmentId: widget.assignmentId,
        authToken: currentJwtToken,
      );

      setState(() {
        questionCatAndLevel = StudentAssignmentStruct.maybeFromMap(
              (_model.responseQuestionList?.jsonBody ?? ''))!.assignmentName;
      });

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
        safeSetState(() {});
        // New Set Selected QN Detail
        FFAppState().newSelectedQnDetail = unsortedQnList.firstOrNull!.questionResponseDTO;
        safeSetState(() {});
        // Set Loading False
        FFAppState().isLoading = false;
        safeSetState(() {});
        // Set ansList
        FFAppState().ansList = getAdditionAnsLength(unsortedQnList.firstOrNull!.questionResponseDTO.questionLevel);
        _model.timerController.onStartTimer();
        return;
      } else {
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
      child: Form(
        key: _formKey,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                if (!FFAppState().isLoading)
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 700
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.sizeOf(context).width * 1.0,
                              maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                              minHeight: 800
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 228.0,
                                    constraints: const BoxConstraints(
                                      minWidth: 228.0,
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
                                              54.0,
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
                                                    'Keyvfx_${questionItem.questionResponseDTO.id}',
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
                                  SizedBox(
                                    width: ((MediaQuery.sizeOf(context).width - 228)).clamp(1000, 2000),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          if (FFAppState().bgImg == 'bgOne')
                                            Container(
                                              width:
                                                  MediaQuery.sizeOf(context).width *
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
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                headerTitles[questionCatAndLevel] ?? "Addition",
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
                                                width: (MediaQuery.sizeOf(context).width / 3).clamp(500, 600),
                                                height: 662.0,
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
                                                  borderRadius:
                                                      BorderRadius.circular(20.0),
                                                  border: Border.all(
                                                    color: const Color(0xFFACCDFF),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible: !FFAppState().isLoading,
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            38.0, 38.0, 38.0, 38.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.end,
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
                                                                      fontSize: 16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight: 1.5,
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
                                                                milliSecond: false,
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
                                                                  safeSetState(() {});
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
                                                                    fontSize: 23.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    lineHeight: 1.5,
                                                                  ),
                                                            ),
                                                          ].divide(
                                                              const SizedBox(width: 5.0)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 0.0,
                                                                      0.0, 62.0),
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
                                                                  letterSpacing: 0.0,
                                                                  fontWeight:
                                                                      FontWeight.bold,
                                                                  lineHeight: 1.5,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            height: 100.0,
                                                            decoration: BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize.min,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              74.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        FFAppState()
                                                                            .newSelectedQnDetail
                                                                            .question,
                                                                        style: FlutterFlowTheme.of(
                                                                                context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily:
                                                                                  'DM Sans',
                                                                              fontSize:
                                                                                  33.0,
                                                                              letterSpacing:
                                                                                  0.0,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width: 41.0,
                                                                        height:
                                                                            41.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment:
                                                                              const AlignmentDirectional(
                                                                                  0.0,
                                                                                  0.0),
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                41.0,
                                                                            child:
                                                                                TextFormField(
                                                                              controller:
                                                                                  _model.unknownAnswerTextController,
                                                                              focusNode:
                                                                                  _model.unknownAnswerFocusNode,
                                                                              autofocus:
                                                                                  true,
                                                                              readOnly:
                                                                                  true,
                                                                              obscureText:
                                                                                  false,
                                                                              decoration:
                                                                                  InputDecoration(
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'DM Sans',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      fontFamily: 'DM Sans',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                enabledBorder:
                                                                                    OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    width: 0.5,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                ),
                                                                                focusedBorder:
                                                                                    OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    width: 0.5,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                ),
                                                                                errorBorder:
                                                                                    OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 0.5,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                ),
                                                                                focusedErrorBorder:
                                                                                    OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    width: 0.5,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                ),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context)
                                                                                  .bodyMedium
                                                                                  .override(
                                                                                    fontFamily: 'DM Sans',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              textAlign:
                                                                                  TextAlign.center,
                                                                              validator: _model
                                                                                  .unknownAnswerTextControllerValidator
                                                                                  .asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        width:
                                                                            11.0)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    padding: const EdgeInsets.symmetric(horizontal: 102),
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
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final numCarryOver = functions.getCarryOverNumList(FFAppState().newSelectedQnDetail.questionLevel).map((e) => e).toList();
                                                                                                                    
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
                                                                                          Builder(
                                                                                            builder: (context) {
                                                                                              final firstNumChar = functions.getFirstNumList(FFAppState().newSelectedQnDetail.question).toList().take(4).toList();
                                                                                              if (firstNumChar.isEmpty) {
                                                                                                return SvgPicture.asset(
                                                                                                  'assets/images/assignment_icon.svg',
                                                                                                );
                                                                                              }
                                                                                                                    
                                                                                              return Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: List.generate(firstNumChar.length, (firstNumCharIndex) {
                                                                                                  final firstNumCharItem = firstNumChar[firstNumCharIndex];
                                                                                                  return GeneratedQnFieldWidget(
                                                                                                    key: Key('Keyqdf_${firstNumCharIndex}_of_${firstNumChar.length}'),
                                                                                                    inputChar: firstNumCharItem,
                                                                                                  );
                                                                                                }).divide(const SizedBox(width: 8.0)),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) {
                                                                                              final secondNumChar = functions.getSecondNumList(FFAppState().newSelectedQnDetail.question).toList().take(4).toList();
                                                                                              if (secondNumChar.isEmpty) {
                                                                                                return SvgPicture.asset(
                                                                                                  'assets/images/practice_icon.svg',
                                                                                                );
                                                                                              }
                                                                                                                    
                                                                                              return Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: List.generate(secondNumChar.length, (secondNumCharIndex) {
                                                                                                  final secondNumCharItem = secondNumChar[secondNumCharIndex];
                                                                                                  return GeneratedQnFieldWidget(
                                                                                                    key: Key('Keyofe_${secondNumCharIndex}_of_${secondNumChar.length}'),
                                                                                                    inputChar: secondNumCharItem,
                                                                                                  );
                                                                                                }).divide(const SizedBox(width: 8.0)),
                                                                                              );
                                                                                            },
                                                                                          ),
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
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    if (FFAppState()
                                                                            .selectedQuestion >
                                                                        1)
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
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
                                                                                .selectedQuestion = FFAppState()
                                                                                    .selectedQuestion +
                                                                                -1;
                                                                            safeSetState(
                                                                                () {});
                                                                            // Change qn detail
                                                                            FFAppState().newSelectedQnDetail = FFAppState()
                                                                                .newQuestionList
                                                                                .elementAtOrNull(FFAppState().selectedQuestion -
                                                                                    1)!
                                                                                .questionResponseDTO;
                                                                            safeSetState(
                                                                                () {});
                                                                            // Clear ansList
                                                                            FFAppState().ansList =
                                                                                [];
                                                                            // Reset Answer Input
                                                                              FFAppState()
                                                                                  .ansList = getAdditionAnsLength(FFAppState().newQuestionList.firstOrNull!.questionResponseDTO.questionLevel);
                                                                            for (var v in ansControllers.values) {
                                                                              v.clear();
                                                                            }
                                                                            for (var x in coControllers.values) {
                                                                              x.clear();
                                                                            }
                                                                            _model.updatePage(
                                                                                () {});
                                                                            await Future.delayed(const Duration(
                                                                                milliseconds:
                                                                                    100));
                                                                            _model
                                                                                .timerController
                                                                                .onResetTimer();
                                                                                                                    
                                                                            _model
                                                                                .timerController
                                                                                .onStartTimer();
                                                                          },
                                                                          text:
                                                                              '< Back',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                136.0,
                                                                            height:
                                                                                38.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color: FlutterFlowTheme.of(context)
                                                                                .primaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context)
                                                                                .titleSmall
                                                                                .override(
                                                                                  fontFamily: 'DM Sans',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color:
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                              width:
                                                                                  1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (FFAppState()
                                                                            .selectedQuestion <
                                                                        (StudentAssignmentStruct.maybeFromMap((_model.responseQuestionList?.jsonBody ??
                                                                                    ''))!
                                                                                .assignmentQuestionResponseDTOList
                                                                                .length +
                                                                            1))
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                6.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {

                                                                            if (!_formKey.currentState!.validate()) {
                                                                              return;
                                                                            }
                                                                            var shouldSetState =
                                                                                false;
                                                                                                                    
                                                                            var listDigits = FFAppState().newSelectedQnDetail.question.replaceAll(" ", "").split(FFAppState().newSelectedQnDetail.questionTopic == "ADDITION" ? "+" : "-").map((element) => element.replaceAll("=", "")).toList();
                                                                            var carryOver = int.parse(FFAppState().carryOverList.join().replaceAll("", "0"));
        
                                                                            // Call Attempt API
                                                                            _model.assignmentResponse = await LiveQuestionManagementGroup
                                                                                .attemptQuestionCall
                                                                                .call(
                                                                              questionId: FFAppState()
                                                                                  .newSelectedQnDetail
                                                                                  .id.toString(),
                                                                              answer: (List<String>
                                                                                  ansList) {
                                                                                return ansList.join();
                                                                              }(FFAppState()
                                                                                  .ansList
                                                                                  .toList()),
                                                                              studentId: FFAppState()
                                                                                  .MockStudent
                                                                                  .studentId,
                                                                              assignmentId:
                                                                                  widget.assignmentId,
                                                                              additionalDetailsJson:
                                                                              [AdditionalDetailObjectStruct(
                                                                                mathOperation: FFAppState().newSelectedQnDetail.questionTopic,
                                                                                mathSteps: [MathStepStruct(digit1: int.parse(listDigits[0]), digit2: int.parse(listDigits[1]), carry: carryOver, currSum: int.parse(FFAppState().ansList.join()))]
                                                                              ).toMap()],
                                                                              authToken: currentJwtToken,
                                                                            );
                                                                                                                    
                                                                            shouldSetState =
                                                                                true;
                                                                            if (StudentAssignmentStruct.maybeFromMap((_model.assignmentResponse?.jsonBody ??
                                                                                    ''))!
                                                                                .assignmentQuestionResponseDTOList
                                                                                .where((e) =>
                                                                                    e.questionResponseDTO.id ==
                                                                                    FFAppState().newSelectedQnDetail.id)
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
                                                                                    title: const Text('Correct'),
                                                                                    content: Text('You have completed the qn in: ${_model.timerValue}'),
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
                                                                              setState(() {
                                                                                showFeedback = StudentAssignmentStruct.maybeFromMap((_model.assignmentResponse?.jsonBody ?? ""))!.feedback;
                                                                              });
                                                                              await showDialog(
                                                                                context:
                                                                                    context,
                                                                                builder:
                                                                                    (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: const Text('Wrong'),
                                                                                    content: Text((List<String> var1) {
                                                                                      return var1.join("");
                                                                                    }(FFAppState().ansList.toList())),
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
                                                                            // Set QnList to update correct/wrong answers
                                                                              List<AssignmentResponseDTOStruct> unsortedQnList = StudentAssignmentStruct.maybeFromMap((_model.assignmentResponse?.jsonBody ??
                                                                                      ''))!
                                                                                  .assignmentQuestionResponseDTOList
                                                                                  .toList()
                                                                                  .cast<AssignmentResponseDTOStruct>();
                                                                              unsortedQnList.sort((a, b) => a.questionResponseDTO.id.compareTo(b.questionResponseDTO.id));
                                                                              FFAppState()
                                                                                  .newQuestionList = unsortedQnList;
                                                                              safeSetState(
                                                                                  () {});                                                                                                       
                                                                            if (StudentAssignmentStruct.maybeFromMap((_model.assignmentResponse?.jsonBody ?? ''))?.completionRate ==
                                                                                1.0) {
                                                                              context
                                                                                  .pushNamed('KidsPerfect');
                                                                                                                    
                                                                              // Remove Ans Length
                                                                              FFAppState().ansLength =
                                                                                  [];
                                                                              safeSetState(
                                                                                  () {});
                                                                              // Reset Answer Input
                                                                              FFAppState()
                                                                                  .ansList = getAdditionAnsLength(unsortedQnList.firstOrNull!.questionResponseDTO.questionLevel);
                                                                              FFAppState()
                                                                                  .update(() {});
                                                                              if (shouldSetState) {
                                                                                safeSetState(() {});
                                                                              }
                                                                              return;
                                                                            } else {
                                                                              // Next Question
                                                                              FFAppState().selectedQuestion =
                                                                                  FFAppState().selectedQuestion + 1;
                                                                              safeSetState(
                                                                                  () {});
                                                                            }
                                                                            _model.updatePage(
                                                                                () {});
                                                                            await Future.delayed(const Duration(
                                                                                milliseconds:
                                                                                    100));
                                                                            FFAppState().update(() {
                                                                              // Reset Answer Input
                                                                            FFAppState()
                                                                                  .ansList = getAdditionAnsLength(unsortedQnList.firstOrNull!.questionResponseDTO.questionLevel);
                                                                            });
                                                                            // reset carryOver input
                                                                            FFAppState().carryOverList = [
                                                                              "",
                                                                              "",
                                                                              "",
                                                                              ""
                                                                            ].toList().cast<String>();
                                                                            FFAppState()
                                                                                .update(() {});
                                                                            // Set Next Question Detail
                                                                            FFAppState()
                                                                                .newSelectedQnDetail = unsortedQnList
                                                                                .elementAtOrNull(FFAppState().selectedQuestion -
                                                                                    1)!
                                                                                .questionResponseDTO;
                                                                            safeSetState(
                                                                                () {});
                                                                            for (var v in ansControllers.values) {
                                                                              v.clear();
                                                                            }
                                                                            for (var x in coControllers.values) {
                                                                              x.clear();
                                                                            }
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
                                                                          text:
                                                                              'Next >',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                136.0,
                                                                            height:
                                                                                38.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color: FlutterFlowTheme.of(context)
                                                                                .primary,
                                                                            textStyle: FlutterFlowTheme.of(context)
                                                                                .titleSmall
                                                                                .override(
                                                                                  fontFamily: 'DM Sans',
                                                                                  color: Colors.white,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color:
                                                                                  Colors.transparent,
                                                                              width:
                                                                                  1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 19.0)),
                                          ),
                                          Stack(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
      ),
    );
  }
}

class AddSubAnsFields extends StatefulWidget {
  const AddSubAnsFields({
    super.key,
    required KidAdditionModel model,
    required this.safeSetState,
    required this.controllers,
  }) : _model = model;

  final KidAdditionModel _model;
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
        final numAnswers = functions
            .getAdditionAnsLength(FFAppState()
                .newSelectedQnDetail
                .questionLevel)
            .map((e) =>
                e)
            .toList()
            .take(4)
            .toList();
                                                
        return Row(
          mainAxisAlignment:
              MainAxisAlignment.end,
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
                ansControllers: widget.controllers
              ),
              updateOnChange: true
            );
          }).divide(
              const SizedBox(width: 8.0)),
        );
      },
    );
  }
}
