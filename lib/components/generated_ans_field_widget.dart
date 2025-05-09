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
    required this.textEditingController,
    required this.ansControllers,
    required this.updateFn
  });

  final String? inputValue;
  final int? idx;
  final TextEditingController textEditingController;
  final Map<int, TextEditingController> ansControllers;
  final Function updateFn;

  @override
  State<GeneratedAnsFieldWidget> createState() =>
      _GeneratedAnsFieldWidgetState();
}

class _GeneratedAnsFieldWidgetState extends State<GeneratedAnsFieldWidget> {
  late GeneratedAnsFieldModel _model;
  late FocusNode _focusNode;

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
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 41,
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: TextFormField(
          controller: widget.textEditingController,
          focusNode: _focusNode,
          onChanged: (_) => EasyDebounce.debounce(
            'widget.textEditingController',
            const Duration(milliseconds: 0),
            () async {
              widget.updateFn(widget.idx!,
                (_) => widget.textEditingController.text);
            },
          ),
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
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
          
          validator: (value) {
            // if any of the text input fields to my left is filled and I am empty, return ""
          for (final mapEntry in widget.ansControllers.entries) {
            if (mapEntry.key < widget.idx! && mapEntry.value.text.isNotEmpty && (value!.isEmpty)) {
              return '';
            }
          } 
            return null;
          }
              // _model.ansFieldTextControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
