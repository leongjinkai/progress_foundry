import '/components/replay_section_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'kids_home_page_replay_model.dart';
export 'kids_home_page_replay_model.dart';

class KidsHomePageReplayWidget extends StatefulWidget {
  const KidsHomePageReplayWidget({super.key});

  @override
  State<KidsHomePageReplayWidget> createState() =>
      _KidsHomePageReplayWidgetState();
}

class _KidsHomePageReplayWidgetState extends State<KidsHomePageReplayWidget> {
  late KidsHomePageReplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidsHomePageReplayModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(81.0, 19.0, 81.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(0.0),
            ),
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(
                    _model.dropDownValue ??= 'Last 5 days',
                  ),
                  options: const ['Last 5 days', 'Last 10 days', 'Last 15 days'],
                  onChanged: (val) =>
                      safeSetState(() => _model.dropDownValue = val),
                  width: 274.0,
                  height: 50.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF7C7C7C),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        lineHeight: 1.5,
                      ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: const Color(0xFF9B9B9B),
                  borderWidth: 0.0,
                  borderRadius: 16.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 9999.0,
                  buttonSize: 36.0,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.sort,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ]
                  .divide(const SizedBox(width: 620.0))
                  .addToStart(const SizedBox(width: 45.0))
                  .addToEnd(const SizedBox(width: 45.0)),
            ),
          ),
          Container(
            width: 1023.0,
            constraints: const BoxConstraints(
              maxWidth: 1023.0,
            ),
            decoration: const BoxDecoration(),
            child: wrapWithModel(
              model: _model.replaySectionModel,
              updateCallback: () => safeSetState(() {}),
              child: const ReplaySectionWidget(),
            ),
          ),
        ].divide(const SizedBox(height: 36.0)),
      ),
    );
  }
}
