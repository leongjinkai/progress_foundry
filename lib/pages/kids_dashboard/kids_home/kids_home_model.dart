import '/flutter_flow/flutter_flow_util.dart';
import '/pages/kids_dashboard/kids_change_bg/kids_change_bg_widget.dart';
import '/pages/kids_dashboard/kids_home_page_assignment/kids_home_page_assignment_widget.dart';
import '/pages/kids_dashboard/kids_home_page_practice/kids_home_page_practice_widget.dart';
import '/pages/kids_dashboard/kids_home_page_replay/kids_home_page_replay_widget.dart';
import '/pages/kids_dashboard/kids_home_page_t_b_c/kids_home_page_t_b_c_widget.dart';
import 'kids_home_widget.dart' show KidsHomeWidget;
import 'package:flutter/material.dart';

class KidsHomeModel extends FlutterFlowModel<KidsHomeWidget> {
  ///  Local state fields for this page.

  String selectedSection = 'Assignment';

  ///  State fields for stateful widgets in this page.

  // Model for KidsHomePageAssignment component.
  late KidsHomePageAssignmentModel kidsHomePageAssignmentModel;
  // Model for KidsHomePageTBC component.
  late KidsHomePageTBCModel kidsHomePageTBCModel;
  // Model for KidsHomePagePractice component.
  late KidsHomePagePracticeModel kidsHomePagePracticeModel;
  // Model for KidsChangeBg component.
  late KidsChangeBgModel kidsChangeBgModel;
  // Model for KidsHomePageReplay component.
  late KidsHomePageReplayModel kidsHomePageReplayModel;

  @override
  void initState(BuildContext context) {
    kidsHomePageAssignmentModel =
        createModel(context, () => KidsHomePageAssignmentModel());
    kidsHomePageTBCModel = createModel(context, () => KidsHomePageTBCModel());
    kidsHomePagePracticeModel =
        createModel(context, () => KidsHomePagePracticeModel());
    kidsChangeBgModel = createModel(context, () => KidsChangeBgModel());
    kidsHomePageReplayModel =
        createModel(context, () => KidsHomePageReplayModel());
  }

  @override
  void dispose() {
    kidsHomePageAssignmentModel.dispose();
    kidsHomePageTBCModel.dispose();
    kidsHomePagePracticeModel.dispose();
    kidsChangeBgModel.dispose();
    kidsHomePageReplayModel.dispose();
  }
}
