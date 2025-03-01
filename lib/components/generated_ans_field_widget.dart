import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'generated_ans_field_model.dart';
export 'generated_ans_field_model.dart';

class GeneratedAnsFieldWidget extends StatefulWidget {
  const GeneratedAnsFieldWidget({
    super.key,
    required this.inputValue,
    required this.idx,
  });

  final String? inputValue;
  final int? idx;

  @override
  State<GeneratedAnsFieldWidget> createState() =>
      _GeneratedAnsFieldWidgetState();
}

class _GeneratedAnsFieldWidgetState extends State<GeneratedAnsFieldWidget> {
  late GeneratedAnsFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneratedAnsFieldModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.ansFieldTextController?.clear();
      });
    });

    _model.ansFieldTextController ??= TextEditingController();
    _model.ansFieldFocusNode ??= FocusNode();

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

    return Container(
      width: 41.0,
      height: 41.0,
      decoration: const BoxDecoration(),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: SizedBox(
          width: 41.0,
          child: TextFormField(
            controller: _model.ansFieldTextController,
            focusNode: _model.ansFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.ansFieldTextController',
              const Duration(milliseconds: 0),
              () async {
                FFAppState().updateAnsListAtIndex(
                  widget.idx!,
                  (_) => _model.ansFieldTextController.text,
                ); 
              },
            ),
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
                    {required currentLength, required isFocused, maxLength}) =>
                null,
            keyboardType: TextInputType.number,
            validator:
                _model.ansFieldTextControllerValidator.asValidator(context),
          ),
        ),
      ),
    );
  }
}
