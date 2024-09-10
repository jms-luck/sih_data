import '/flutter_flow/flutter_flow_util.dart';
import 'f_armerprofile_widget.dart' show FArmerprofileWidget;
import 'package:flutter/material.dart';

class FArmerprofileModel extends FlutterFlowModel<FArmerprofileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
