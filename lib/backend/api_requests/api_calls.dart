import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase API Calls Group Code

class SupabaseAPICallsGroup {
  static String getBaseUrl() => 'https://eadflnthowatnupyrimn.supabase.co/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
  };
  static CreateNewUserCall createNewUserCall = CreateNewUserCall();
  static SigninUserCall signinUserCall = SigninUserCall();
  static CreateTeamCall createTeamCall = CreateTeamCall();
  static InviteUserIntoTeamCall inviteUserIntoTeamCall =
      InviteUserIntoTeamCall();
  static AcceptInvitationIntoTeamCall acceptInvitationIntoTeamCall =
      AcceptInvitationIntoTeamCall();
  static ListTeamMembersCall listTeamMembersCall = ListTeamMembersCall();
  static RemoveUserFromTeamCall removeUserFromTeamCall =
      RemoveUserFromTeamCall();
}

class CreateNewUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = SupabaseAPICallsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createNewUser',
      apiUrl: '${baseUrl}auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SigninUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = SupabaseAPICallsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signinUser',
      apiUrl: '${baseUrl}auth/v1/token?grant_type=password',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTeamCall {
  Future<ApiCallResponse> call({
    String? teamName = '',
    String? teamSlug = '',
    String? authToken = '',
  }) async {
    final baseUrl = SupabaseAPICallsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$teamName",
  "slug": "$teamSlug"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTeam',
      apiUrl: '${baseUrl}rest/v1/rpc/create_account',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteUserIntoTeamCall {
  Future<ApiCallResponse> call({
    String? teamIdToInvite = '',
    String? accountRole = '',
    String? invitationType = '',
    String? authToken = '',
  }) async {
    final baseUrl = SupabaseAPICallsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "account_id": "$teamIdToInvite",
  "account_role": "$accountRole",
  "invitation_type": "$invitationType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'inviteUserIntoTeam',
      apiUrl: '${baseUrl}rest/v1/rpc/create_invitation',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AcceptInvitationIntoTeamCall {
  Future<ApiCallResponse> call({
    String? invitationToken = '',
    String? authToken = '',
  }) async {
    final baseUrl = SupabaseAPICallsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
    "lookup_invitation_token": "$invitationToken"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'acceptInvitationIntoTeam',
      apiUrl: '${baseUrl}rest/v1/rpc/accept_invitation',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListTeamMembersCall {
  Future<ApiCallResponse> call({
    String? teamId = '',
    String? authToken = '',
  }) async {
    final baseUrl = SupabaseAPICallsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "account_id": "$teamId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'listTeamMembers',
      apiUrl: '${baseUrl}rest/v1/rpc/get_account_members',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveUserFromTeamCall {
  Future<ApiCallResponse> call({
    String? teamIdToRemove = '',
    String? authToken = '',
    String? accountId = '',
  }) async {
    final baseUrl = SupabaseAPICallsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "account_id": "$teamIdToRemove",
  "user_id": "$accountId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeUserFromTeam',
      apiUrl: '${baseUrl}rest/v1/rpc/remove_account_member',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apiKey': const String.fromEnvironment('SUPABASE_API_KEY', defaultValue:''),
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Supabase API Calls Group Code

/// Start Live Question Management Group Code

class LiveQuestionManagementGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://progress-foundry.peerserver.duckdns.org/api/v1.0';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
  };
  static GetAllQuestionsCall getAllQuestionsCall = GetAllQuestionsCall();
  static GenerateQuestionCall generateQuestionCall = GenerateQuestionCall();
  static AttemptQuestionCall attemptQuestionCall = AttemptQuestionCall();
  static GetAssignmentsByStudentIdCall getAssignmentsByStudentIdCall =
      GetAssignmentsByStudentIdCall();
  static GetSpecificAssignmentCall getSpecificAssignmentCall =
      GetSpecificAssignmentCall();
  static GetStudentProgressCall getStudentProgressCall =
      GetStudentProgressCall();
  static CreateNewAssignmentCall createNewAssignmentCall =
      CreateNewAssignmentCall();
}

class GetAllQuestionsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = LiveQuestionManagementGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get All Questions',
      apiUrl: '$baseUrl/manage-question/normal-questions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateQuestionCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = LiveQuestionManagementGroup.getBaseUrl(
      authToken: authToken,
    );

    const ffApiRequestBody = '''
{
  "studentId": "690794cd-40fc-41a6-ad6b-63ee6489c99a",
  "questionSubject": "MATHEMATICS",
  "questionTopic": "ADDITION",
  "questionLevel": "SINGLE_DIGIT",
  "questionSubLevel": "DOUBLE_RANDOM",
  "questionType": "SHORT_ANSWER",
  "isAnswerExact": true,
  "isRandom": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Question',
      apiUrl: '$baseUrl/manage-question/generate-normal-question',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AttemptQuestionCall {
  Future<ApiCallResponse> call({
    String? studentId = '690794cd-40fc-41a6-ad6b-63ee6489c99a',
    String? questionId = '9788ff03-181c-4e4a-a4fe-9d3b32be8687',
    String? answer = '117',
    String? assignmentId = 'c69b7d72-3dfd-4367-82c5-ff872dc96647',
    dynamic additionalDetailsJson,
    String? authToken = '',
  }) async {
    final baseUrl = LiveQuestionManagementGroup.getBaseUrl(
      authToken: authToken,
    );

    final additionalDetails = _serializeJson(additionalDetailsJson, true);
    final ffApiRequestBody = '''
{
  "assignmentId": "$assignmentId",
  "studentId": "$studentId",
  "questionId": "$questionId",
  "answer": "$answer",
  "additionalDetails": $additionalDetails
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Attempt Question',
      apiUrl: '$baseUrl/manage-assignment/normal-question-attempt',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAssignmentsByStudentIdCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = LiveQuestionManagementGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Assignments by Student Id',
      apiUrl: '$baseUrl/manage-assignment/student',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'studentId': "690794cd-40fc-41a6-ad6b-63ee6489c99a",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSpecificAssignmentCall {
  Future<ApiCallResponse> call({
    String? assignmentId = 'c69b7d72-3dfd-4367-82c5-ff872dc96647',
    String? authToken = '',
  }) async {
    final baseUrl = LiveQuestionManagementGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Specific Assignment',
      apiUrl: '$baseUrl/manage-assignment',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'assignmentId': assignmentId,
        'studentId': "690794cd-40fc-41a6-ad6b-63ee6489c99a",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetStudentProgressCall {
  Future<ApiCallResponse> call({
    String? studentId = '690794cd-40fc-41a6-ad6b-63ee6489c99a',
    String? authToken = '',
  }) async {
    final baseUrl = LiveQuestionManagementGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Student Progress',
      apiUrl: '$baseUrl/manage-assignment/progress',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'studentId': studentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateNewAssignmentCall {
  Future<ApiCallResponse> call({
    String? studentId = '',
    String? dueDate = '',
    String? questionSubject = '',
    String? questionTopic = '',
    String? questionLevel = '',
    String? questionSubLevel = '',
    String? questionType = '',
    String? authToken = '',
  }) async {
    final baseUrl = LiveQuestionManagementGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "studentId": "$studentId",
  "dueDate": "$dueDate",
  "questionSubject": "$questionSubject",
  "questionTopic": "$questionTopic",
  "questionLevel": "$questionLevel",
  "questionSubLevel": "$questionSubLevel",
  "questionType": "$questionType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create New Assignment',
      apiUrl: '$baseUrl/manage-assignment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Live Question Management Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
