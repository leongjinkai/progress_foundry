import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'generated_qn_field_model.dart';
export 'generated_qn_field_model.dart';

class GeneratedQnFieldWidget extends StatefulWidget {
  const GeneratedQnFieldWidget({
    super.key,
    required this.inputChar,
  });

  final String? inputChar;

  @override
  State<GeneratedQnFieldWidget> createState() => _GeneratedQnFieldWidgetState();
}

class _GeneratedQnFieldWidgetState extends State<GeneratedQnFieldWidget> {
  late GeneratedQnFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneratedQnFieldModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 41.0,
        height: 41.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          valueOrDefault<String>(
            widget.inputChar,
            '?',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'DM Sans',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
