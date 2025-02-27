// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_drawing_board/flutter_drawing_board.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DrawingCanvas> createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  @override
  Widget build(BuildContext context) {
    return DrawingBoard(
      background: Container(
          width: widget.width, height: widget.height, color: Colors.white),
      showDefaultActions: true,

      /// Enable default action options
      showDefaultTools: true,

      /// Enable default toolbar
    );
  }
}
