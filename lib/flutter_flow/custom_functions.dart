import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? getAnswer(
  String? tens,
  String? ones,
) {
  return int.parse(tens! + ones!);
}

bool checkMultiplication(
  List<String> multiples,
  String questionMultiple,
) {
  print(multiples);
  for (var idx = 0; idx < multiples.length; idx++) {
    var nextIdx = idx + 1;
    print("test start");
    print(multiples[idx]);
    print(nextIdx);
    print(questionMultiple);
    print(int.parse(questionMultiple) * nextIdx);
    print("test end");
    print(int.parse(multiples[idx]) != (int.parse(questionMultiple) * nextIdx));
    if (int.parse(multiples[idx]) != (int.parse(questionMultiple) * nextIdx)) {
      return false;
    }
  }
  return true;
}

dynamic convertMultiplicationObjectToJSON(
    MultiplicationObjectStruct multiplicationObject) {
  return jsonEncode({
    'multiplicationSteps': multiplicationObject.multiplicationSteps
        .map((step) => {
              'partialResult': step.partialResult,
              'productDigit': step.productDigit,
              'carry': step.carry,
              'product': step.product,
            })
        .toList()
  });
}

dynamic convertSubtractionObjectToJSON(
    SubtractionObjectStruct subtractionObject) {
  return jsonEncode({
    'multiplicationSteps': subtractionObject.subtractionSteps
        .map((step) => {
              'bigNum': step.bigNum,
              'smallNum': step.smallNum,
              'borrowed': step.borrowed,
              'result': step.result,
            })
        .toList()
  });
}

int convertStrToInteger(String questionNumber) {
  return int.parse(questionNumber);
}

String? getOperatorFromTopic(String questionTopic) {
  switch (questionTopic) {
    case "ADDITION":
      return "+";
    case "SUBTRACTION":
      return "-";
    default:
      return "?";
  }
}

List<String> getFirstNumList(String question) {
  debugPrint(question);
  return question.split(" ")[0].split("");
}

List<String> getSecondNumList(String question) {
  return question.split(" ")[2].split("");
}

List<String> getAnsNumList(NormalQuestionStruct questionDetail) {
  return questionDetail.answer.split("");
}

String? getAssigmentCardContentHeader(
  String qnTopic,
  String qnLevel,
) {
  var topicText = "";
  switch (qnTopic) {
    case "ADDITION":
      topicText = "Adding to ";
      break;
    case "SUBTRACTION":
      topicText = "Subtracting to ";
      break;
    case "MULTIPLICATION":
      topicText = "digit multiplication ";
      break;
    case "DIVISON":
      topicText = "digit division ";
      break;
    default:
  }

  var difficulty = "";
  switch (qnLevel) {
    case "SINGLE_DIGIT":
      difficulty = "10";
      break;
    case "DOUBLE_DIGIT":
      difficulty = "100";
      break;
    case "TRIPLE_DIGIT":
      difficulty = "1000";
      break;
    default:
  }

  return qnTopic[0] +
      qnTopic.substring(1).toLowerCase() +
      " - " +
      topicText +
      difficulty;
}

String getProgressText(String completionRate) {
  var numQnsCompleted = double.parse(completionRate) * 10;
  return numQnsCompleted.toString() + "/10";
}

List<String> getCarryOverNumList(String qnLevel) {
  switch (qnLevel) {
    case "SINGLE_DIGIT":
      return [""];
    case "DOUBLE_DIGIT":
      return ["", ""];
    default:
      return [];
  }
}

List<String> getAdditionAnsLength(String qnLevel) {
  switch (qnLevel) {
    case "SINGLE_DIGIT":
      return ["1", "1"];
    case "DOUBLE_DIGIT":
      return ["1", "1", "1"];
    default:
      return ["1"];
  }
}

String getQnLevelFromDropdown(String dropdownText) {
  switch (dropdownText) {
    case "Adding to 10" || "Subtracting to 10" || "Multiplication to 10" || "Division to 10":
      return "SINGLE_DIGIT";
    case "Adding to 100" || "Subtracting to 100" || "Multiplication to 100" || "Division to 100":
      return "DOUBLE_DIGIT";
    case "Adding to 1000" || "Subtracting to 1000" || "Multiplication to 1000" || "Division to 1000":
      return "TRIPLE_DIGIT";
    default:
      return "";
  }
}

String getQnSubLevelFromDropdown(String selectedQnCat, String qnLevel) {
  switch (selectedQnCat) {
    case "Addition":
      switch (qnLevel) {
        case "SINGLE_DIGIT":
          return "DOUBLE_SEQUENTIAL";
        case "DOUBLE_DIGIT":
          return "SEQUENTIAL_FIRST_OPERAND_IN_TENS_WITH_SEQUENTIAL_SINGLE_DIGIT_SECOND_OPERAND";
        case "TRIPLE_DIGIT":
          return "SEQUENTIAL_FIRST_OPERAND_WITH_RANDOM_SINGLE_OR_DOUBLE_DIGIT_SECOND_OPERAND";
        default:
          return "";
      }
    case "Subtraction":
      switch (qnLevel) {
        case "SINGLE_DIGIT":
          return "RANDOM_WITH_SECOND_OPERAND_BELOW_FIVE";
        case "DOUBLE_DIGIT":
          return "SEQUENTIAL_FIRST_OPERAND_IN_TENS_WITH_RANDOM_SINGLE_DIGIT_SECOND_OPERAND";
        case "TRIPLE_DIGIT":
          return "SEQUENTIAL_FIRST_OPERAND_WITH_RANDOM_SINGLE_OR_DOUBLE_DIGIT_SECOND_OPERAND";
        default:
          return "";
      }
    case "Multiplication":
      return "";
    case "Division":
      switch (qnLevel) {
        case "SINGLE_DIGIT":
          return "DOUBLE_SEQUENTIAL";
        case "DOUBLE_DIGIT":
          return "RANDOM_SINGLE_OR_DOUBLE_DIGIT_NUMERATOR_AND_RANDOM_SINGLE_DIGIT_DENOMINATOR";
        case "TRIPLE_DIGIT":
          return "RANDOM_TRIPLE_NUMERATOR_AND_RANDOM_SINGLE_DIGIT_DENOMINATOR";
        default:
          return "";
      }
    default:
      return "";
  }
}

List<String> getDivisonAnsLength(String qnLevel) {
  switch (qnLevel) {
    case "SINGLE_DIGIT":
      return ["1"];
    case "DOUBLE_DIGIT":
      return ["1"];
    case "TRIPLE_DIGIT":
      return ["1"];
    default:
      return ["1"];
  }
}
