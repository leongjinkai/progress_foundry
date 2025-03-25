import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated_c_o_field_model.dart';
export 'generated_c_o_field_model.dart';

class GeneratedCOFieldWidget extends StatefulWidget {
  const GeneratedCOFieldWidget({
    super.key,
    required this.inputChar,
    required this.ansId,
    required this.controller
  });

  final String? inputChar;
  final int? ansId;
  final TextEditingController controller;

  @override
  State<GeneratedCOFieldWidget> createState() => _GeneratedCOFieldWidgetState();
}

class _GeneratedCOFieldWidgetState extends State<GeneratedCOFieldWidget> {
  late GeneratedCOFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneratedCOFieldModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.textController?.clear();
      });
    });


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
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 41.0,
        height: 41.0,
        decoration: const BoxDecoration(),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: SizedBox(
            width: 41.0,
            child: TextFormField(
              controller: widget.controller,
              focusNode: _model.textFieldFocusNode,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                isDense: true,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'DM Sans',
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'DM Sans',
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(0.0),
                ),
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              textAlign: TextAlign.center,
              maxLength: 1,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              keyboardType: TextInputType.number,
              validator: _model.textControllerValidator.asValidator(context),
              onChanged: (_) => EasyDebounce.debounce(
                '_model.carryOverFieldTextController',
                const Duration(milliseconds: 0),
                () async {
                  FFAppState().updateCarryOverListAtIndex(
                    widget.ansId!,
                    (_) => widget.controller.text,
                  ); 
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
