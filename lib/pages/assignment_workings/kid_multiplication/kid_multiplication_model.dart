import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kid_multiplication_widget.dart' show KidMultiplicationWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class KidMultiplicationModel extends FlutterFlowModel<KidMultiplicationWidget> {
  ///  Local state fields for this page.

  List<int> incrementInt = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  void addToIncrementInt(int item) => incrementInt.add(item);
  void removeFromIncrementInt(int item) => incrementInt.remove(item);
  void removeAtIndexFromIncrementInt(int index) => incrementInt.removeAt(index);
  void insertAtIndexInIncrementInt(int index, int item) =>
      incrementInt.insert(index, item);
  void updateIncrementIntAtIndex(int index, Function(int) updateFn) =>
      incrementInt[index] = updateFn(incrementInt[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
