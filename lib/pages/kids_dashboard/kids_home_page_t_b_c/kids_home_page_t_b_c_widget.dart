import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'kids_home_page_t_b_c_model.dart';
export 'kids_home_page_t_b_c_model.dart';

class KidsHomePageTBCWidget extends StatefulWidget {
  const KidsHomePageTBCWidget({super.key});

  @override
  State<KidsHomePageTBCWidget> createState() => _KidsHomePageTBCWidgetState();
}

class _KidsHomePageTBCWidgetState extends State<KidsHomePageTBCWidget> {
  late KidsHomePageTBCModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidsHomePageTBCModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 1024.0,
          height: 189.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
          ),
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(47.0, 0.0, 0.0, 0.0),
            child: Text(
              'Building in Progress!',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 33.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    lineHeight: 1.5,
                  ),
            ),
          ),
        ),
      ].divide(const SizedBox(height: 64.0)).addToStart(const SizedBox(height: 28.0)),
    );
  }
}
