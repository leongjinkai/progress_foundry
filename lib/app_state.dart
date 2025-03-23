import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _QuestionList = prefs
              .getStringList('ff_QuestionList')
              ?.map((x) {
                try {
                  return NormalQuestionStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _QuestionList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _carryOverLength = 1;
  int get carryOverLength => _carryOverLength;
  set carryOverLength(int value) {
    _carryOverLength = value;
  }

  List<String> _QuestionBubbleList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  List<String> get QuestionBubbleList => _QuestionBubbleList;
  set QuestionBubbleList(List<String> value) {
    _QuestionBubbleList = value;
  }

  void addToQuestionBubbleList(String value) {
    QuestionBubbleList.add(value);
  }

  void removeFromQuestionBubbleList(String value) {
    QuestionBubbleList.remove(value);
  }

  void removeAtIndexFromQuestionBubbleList(int index) {
    QuestionBubbleList.removeAt(index);
  }

  void updateQuestionBubbleListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    QuestionBubbleList[index] = updateFn(_QuestionBubbleList[index]);
  }

  void insertAtIndexInQuestionBubbleList(int index, String value) {
    QuestionBubbleList.insert(index, value);
  }

  List<NormalQuestionStruct> _QuestionList = [
    NormalQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"349f1d8b-7711-4d8a-a449-33155dcf4c1b\",\"questionBankID\":\"9\",\"createdAt\":\"2024-08-06T14:27:37.278592Z\",\"questionSubject\":\"MATHEMATICS\",\"questionTopic\":\"ADDITION\",\"questionLevel\":\"SINGLE_DIGIT\",\"questionType\":\"SHORT_ANSWER\",\"question\":\"9 + 4 =\",\"answer\":\"13\",\"options\":\"\",\"isAnswerExact\":\"true\"}')),
    NormalQuestionStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"91eac876-7866-4880-b6cc-ec60d377bdf1\",\"questionBankID\":\"10\",\"createdAt\":\"2024-08-06T14:27:47.093033Z\",\"questionSubject\":\"MATHEMATICS\",\"questionTopic\":\"ADDITION\",\"questionLevel\":\"SINGLE_DIGIT\",\"questionType\":\"SHORT_ANSWER\",\"question\":\"2 + 7 =\",\"answer\":\"9\",\"options\":\"\",\"isAnswerExact\":\"true\"}'))
  ];
  List<NormalQuestionStruct> get QuestionList => _QuestionList;
  set QuestionList(List<NormalQuestionStruct> value) {
    _QuestionList = value;
    prefs.setStringList(
        'ff_QuestionList', value.map((x) => x.serialize()).toList());
  }

  void addToQuestionList(NormalQuestionStruct value) {
    QuestionList.add(value);
    prefs.setStringList(
        'ff_QuestionList', _QuestionList.map((x) => x.serialize()).toList());
  }

  void removeFromQuestionList(NormalQuestionStruct value) {
    QuestionList.remove(value);
    prefs.setStringList(
        'ff_QuestionList', _QuestionList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromQuestionList(int index) {
    QuestionList.removeAt(index);
    prefs.setStringList(
        'ff_QuestionList', _QuestionList.map((x) => x.serialize()).toList());
  }

  void updateQuestionListAtIndex(
    int index,
    NormalQuestionStruct Function(NormalQuestionStruct) updateFn,
  ) {
    QuestionList[index] = updateFn(_QuestionList[index]);
    prefs.setStringList(
        'ff_QuestionList', _QuestionList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInQuestionList(int index, NormalQuestionStruct value) {
    QuestionList.insert(index, value);
    prefs.setStringList(
        'ff_QuestionList', _QuestionList.map((x) => x.serialize()).toList());
  }

  int _selectedQuestion = 1;
  int get selectedQuestion => _selectedQuestion;
  set selectedQuestion(int value) {
    _selectedQuestion = value;
  }

  List<String> _ansList = [];
  List<String> get ansList => _ansList;
  set ansList(List<String> value) {
    _ansList = value;
  }

  void addToAnsList(String value) {
    ansList.add(value);
  }

  void removeFromAnsList(String value) {
    ansList.remove(value);
  }

  void removeAtIndexFromAnsList(int index) {
    ansList.removeAt(index);
  }

  void updateAnsListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ansList[index] = updateFn(_ansList[index]);
  }

  List<String> _carryOverList = ['', '', '', ''];
  List<String> get carryOverList => _carryOverList;

  set carryOverList(List<String> value) {
    _carryOverList = value;
  }

  void updateCarryOverListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    carryOverList[index] = updateFn(_carryOverList[index]);
  }


  void insertAtIndexInAnsList(int index, String value) {
    ansList.insert(index, value);
  }

  List<int> _correctQns = [];
  List<int> get correctQns => _correctQns;
  set correctQns(List<int> value) {
    _correctQns = value;
  }

  void addToCorrectQns(int value) {
    correctQns.add(value);
  }

  void removeFromCorrectQns(int value) {
    correctQns.remove(value);
  }

  void removeAtIndexFromCorrectQns(int index) {
    correctQns.removeAt(index);
  }

  void updateCorrectQnsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    correctQns[index] = updateFn(_correctQns[index]);
  }

  void insertAtIndexInCorrectQns(int index, int value) {
    correctQns.insert(index, value);
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  List<String> _ansLength = ['1'];
  List<String> get ansLength => _ansLength;
  set ansLength(List<String> value) {
    _ansLength = value;
  }

  void addToAnsLength(String value) {
    ansLength.add(value);
  }

  void removeFromAnsLength(String value) {
    ansLength.remove(value);
  }

  void removeAtIndexFromAnsLength(int index) {
    ansLength.removeAt(index);
  }

  void updateAnsLengthAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ansLength[index] = updateFn(_ansLength[index]);
  }

  void insertAtIndexInAnsLength(int index, String value) {
    ansLength.insert(index, value);
  }

  List<AssignmentStruct> _PracticeList = [
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Adding to 10\",\"progress\":\"0.8\",\"rating\":\"4\",\"type\":\"Addition\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Adding to 100\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Addition\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Adding to 1000\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Addition\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Challenge\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Addition\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Subtracting to 10\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Subtraction\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Subtracting to 100\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Subtraction\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Subtracting to 1000\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Subtraction\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Challenge\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Subtraction\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Single digit multiplication\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Multiplication\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Double digit multiplication\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Multiplication\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Triple digit multiplication\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Multiplication\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Challenge\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Multiplication\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Single Digit Division\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Division\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Double digit division\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Division\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Triple digit division\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Division\"}')),
    AssignmentStruct.fromSerializableMap(jsonDecode(
        '{\"category\":\"Challenge\",\"progress\":\"0\",\"rating\":\"0\",\"type\":\"Division\"}'))
  ];
  List<AssignmentStruct> get PracticeList => _PracticeList;
  set PracticeList(List<AssignmentStruct> value) {
    _PracticeList = value;
  }

  void addToPracticeList(AssignmentStruct value) {
    PracticeList.add(value);
  }

  void removeFromPracticeList(AssignmentStruct value) {
    PracticeList.remove(value);
  }

  void removeAtIndexFromPracticeList(int index) {
    PracticeList.removeAt(index);
  }

  void updatePracticeListAtIndex(
    int index,
    AssignmentStruct Function(AssignmentStruct) updateFn,
  ) {
    PracticeList[index] = updateFn(_PracticeList[index]);
  }

  void insertAtIndexInPracticeList(int index, AssignmentStruct value) {
    PracticeList.insert(index, value);
  }

  List<StudentAssignmentStruct> _AssignmentList = [];
  List<StudentAssignmentStruct> get AssignmentList => _AssignmentList;
  set AssignmentList(List<StudentAssignmentStruct> value) {
    _AssignmentList = value;
  }

  void addToAssignmentList(StudentAssignmentStruct value) {
    AssignmentList.add(value);
  }

  void removeFromAssignmentList(StudentAssignmentStruct value) {
    AssignmentList.remove(value);
  }

  void removeAtIndexFromAssignmentList(int index) {
    AssignmentList.removeAt(index);
  }

  void updateAssignmentListAtIndex(
    int index,
    StudentAssignmentStruct Function(StudentAssignmentStruct) updateFn,
  ) {
    AssignmentList[index] = updateFn(_AssignmentList[index]);
  }

  void insertAtIndexInAssignmentList(int index, StudentAssignmentStruct value) {
    AssignmentList.insert(index, value);
  }

  String _bgImg = '';
  String get bgImg => _bgImg;
  set bgImg(String value) {
    _bgImg = value;
  }

  QuestionResponseDTOStruct _newSelectedQnDetail = QuestionResponseDTOStruct();
  QuestionResponseDTOStruct get newSelectedQnDetail => _newSelectedQnDetail;
  set newSelectedQnDetail(QuestionResponseDTOStruct value) {
    _newSelectedQnDetail = value;
  }

  void updateNewSelectedQnDetailStruct(
      Function(QuestionResponseDTOStruct) updateFn) {
    updateFn(_newSelectedQnDetail);
  }

  List<AssignmentResponseDTOStruct> _newQuestionList = [];
  List<AssignmentResponseDTOStruct> get newQuestionList => _newQuestionList;
  set newQuestionList(List<AssignmentResponseDTOStruct> value) {
    _newQuestionList = value;
  }

  void addToNewQuestionList(AssignmentResponseDTOStruct value) {
    newQuestionList.add(value);
  }

  void removeFromNewQuestionList(AssignmentResponseDTOStruct value) {
    newQuestionList.remove(value);
  }

  void removeAtIndexFromNewQuestionList(int index) {
    newQuestionList.removeAt(index);
  }

  void updateNewQuestionListAtIndex(
    int index,
    AssignmentResponseDTOStruct Function(AssignmentResponseDTOStruct) updateFn,
  ) {
    newQuestionList[index] = updateFn(_newQuestionList[index]);
  }

  void insertAtIndexInNewQuestionList(
      int index, AssignmentResponseDTOStruct value) {
    newQuestionList.insert(index, value);
  }

  StudentStruct _MockStudent = StudentStruct.fromSerializableMap(
      jsonDecode('{\"studentId\":\"690794cd-40fc-41a6-ad6b-63ee6489c99a\"}'));
  StudentStruct get MockStudent => _MockStudent;
  set MockStudent(StudentStruct value) {
    _MockStudent = value;
  }

  void updateMockStudentStruct(Function(StudentStruct) updateFn) {
    updateFn(_MockStudent);
  }

  List<AssignmentResponseDTOStruct> _newCorrectQnsList = [];
  List<AssignmentResponseDTOStruct> get newCorrectQnsList => _newCorrectQnsList;
  set newCorrectQnsList(List<AssignmentResponseDTOStruct> value) {
    _newCorrectQnsList = value;
  }

  void addToNewCorrectQnsList(AssignmentResponseDTOStruct value) {
    newCorrectQnsList.add(value);
  }

  void removeFromNewCorrectQnsList(AssignmentResponseDTOStruct value) {
    newCorrectQnsList.remove(value);
  }

  void removeAtIndexFromNewCorrectQnsList(int index) {
    newCorrectQnsList.removeAt(index);
  }

  void updateNewCorrectQnsListAtIndex(
    int index,
    AssignmentResponseDTOStruct Function(AssignmentResponseDTOStruct) updateFn,
  ) {
    newCorrectQnsList[index] = updateFn(_newCorrectQnsList[index]);
  }

  void insertAtIndexInNewCorrectQnsList(
      int index, AssignmentResponseDTOStruct value) {
    newCorrectQnsList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
