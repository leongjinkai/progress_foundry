import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'multiply_entry_model.dart';
export 'multiply_entry_model.dart';

class MultiplyEntryWidget extends StatefulWidget {
  const MultiplyEntryWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<MultiplyEntryWidget> createState() => _MultiplyEntryWidgetState();
}

class _MultiplyEntryWidgetState extends State<MultiplyEntryWidget> {
  late MultiplyEntryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiplyEntryModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(
            children: [
              TextSpan(
                text: '9 x ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      lineHeight: 1.5,
                    ),
              ),
              TextSpan(
                text: widget.parameter1!.toString(),
                style: const TextStyle(),
              )
            ],
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  lineHeight: 1.5,
                ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '=',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    lineHeight: 1.5,
                  ),
            ),
            Container(
              width: 121.0,
              height: 45.0,
              decoration: const BoxDecoration(),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        lineHeight: 1.5,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'DM Sans',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 13.0, 20.0, 13.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF7C7C7C),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      lineHeight: 1.5,
                    ),
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ].divide(const SizedBox(width: 6.0)),
        ),
      ].divide(const SizedBox(width: 25.0)),
    );
  }
}
