// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String? handleAuthSessionUrlResponse() {
  print('init func');
  String? resultMessage;
  final uri = Uri.parse(Uri.base.path);

  Future<void> exchangeAuthCode() async {
    print('init async');
    try {
      final authCode = uri.queryParameters['code'];
      if (authCode == null || authCode.isEmpty) {
        throw Exception("Authorization code not found in the URL.");
      }
      print(authCode);
      final response =
          await Supabase.instance.client.auth.exchangeCodeForSession(authCode);
      print('getting supabase');
      if (response.session == null) {
        print('Error exchanging code for session: ${response.session}');
        resultMessage = 'Failed to exchange auth code for session.';
        return;
      }

      final session = response.session;
      if (session != null) {
        print('Session exchange successful!');
        print('Access Token: ${session.accessToken}');
        print('Refresh Token: ${session.refreshToken}');
        resultMessage = 'Session exchange successful.';
      } else {
        print('Session exchange completed, but no session returned.');
        resultMessage = 'Session exchange returned no data.';
      }
    } catch (e) {
      print('An error occured: might not be able to get code from uri params');
      print('Exception during session exchange: $e');
      resultMessage = 'An error occurred: $e';
    }
  }

  exchangeAuthCode();
  print(resultMessage);
  return resultMessage;
}
