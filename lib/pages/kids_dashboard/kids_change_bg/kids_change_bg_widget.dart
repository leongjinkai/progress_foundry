import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'kids_change_bg_model.dart';
export 'kids_change_bg_model.dart';

class KidsChangeBgWidget extends StatefulWidget {
  const KidsChangeBgWidget({super.key});

  @override
  State<KidsChangeBgWidget> createState() => _KidsChangeBgWidgetState();
}

class _KidsChangeBgWidgetState extends State<KidsChangeBgWidget> {
  late KidsChangeBgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidsChangeBgModel());

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
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().bgImg = 'bgOne';
                  safeSetState(() {});
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: const Text('Amazing!'),
                        content: const Text(
                            'You have changed your background to Starry Sky.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: Image.asset(
                    'assets/images/bg_1.png',
                    width: 328.0,
                    height: 230.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().bgImg = 'bgTwo';
                  safeSetState(() {});
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: const Text('Amazing!'),
                        content: const Text(
                            'You have changed your background to Eco Loco.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: Image.asset(
                    'assets/images/bg_2.png',
                    width: 328.0,
                    height: 230.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().bgImg = 'bgThree';
                  safeSetState(() {});
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: const Text('Amazing!'),
                        content: const Text(
                            'You have changed your background to Purple Rainbow. '),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: Image.asset(
                    'assets/images/bg_3.png',
                    width: 328.0,
                    height: 230.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().bgImg = ' ';
                  safeSetState(() {});
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: const Text('Amazing!'),
                        content: const Text('You have reset your background.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: 328.0,
                  height: 230.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(13.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Reset Background',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ].divide(const SizedBox(height: 64.0)).addToStart(const SizedBox(height: 28.0)),
    );
  }
}
