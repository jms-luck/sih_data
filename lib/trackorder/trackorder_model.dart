import '/flutter_flow/flutter_flow_util.dart';
import 'trackorder_widget.dart' show TrackorderWidget;
import 'package:flutter/material.dart';

class TrackorderModel extends FlutterFlowModel<TrackorderWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
