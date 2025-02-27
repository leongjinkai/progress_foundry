import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/kids_dashboard/assignment_category/assignment_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'kids_home_page_practice_model.dart';
export 'kids_home_page_practice_model.dart';

class KidsHomePagePracticeWidget extends StatefulWidget {
  const KidsHomePagePracticeWidget({super.key});

  @override
  State<KidsHomePagePracticeWidget> createState() =>
      _KidsHomePagePracticeWidgetState();
}

class _KidsHomePagePracticeWidgetState
    extends State<KidsHomePagePracticeWidget> {
  late KidsHomePagePracticeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KidsHomePagePracticeModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(64.0, 43.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                final assignmentType = FFAppState()
                    .PracticeList
                    .unique((e) => e.type!)
                    .toList()
                    .take(4)
                    .toList();

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(assignmentType.length,
                            (assignmentTypeIndex) {
                      final assignmentTypeItem =
                          assignmentType[assignmentTypeIndex];
                      return AssignmentCategoryWidget(
                        key: Key(
                            'Keyu8f_${assignmentTypeIndex}_of_${assignmentType.length}'),
                        qntype: assignmentTypeItem.type!.name,
                      );
                    })
                        .divide(const SizedBox(height: 46.0))
                        .addToEnd(const SizedBox(height: 43.0)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 80.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 9999.0,
              buttonSize: 40.0,
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
          ),
        ],
      ),
    );
  }
}
