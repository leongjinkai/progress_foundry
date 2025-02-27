import '/components/replay_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'kids_home_page_replay_widget.dart' show KidsHomePageReplayWidget;
import 'package:flutter/material.dart';

class KidsHomePageReplayModel
    extends FlutterFlowModel<KidsHomePageReplayWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for ReplaySection component.
  late ReplaySectionModel replaySectionModel;

  @override
  void initState(BuildContext context) {
    replaySectionModel = createModel(context, () => ReplaySectionModel());
  }

  @override
  void dispose() {
    replaySectionModel.dispose();
  }
}
