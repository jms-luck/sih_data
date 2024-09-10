import '/flutter_flow/flutter_flow_util.dart';
import 'contract_widget.dart' show ContractWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class ContractModel extends FlutterFlowModel<ContractWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature widget.
  SignatureController? signatureController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signatureController?.dispose();
  }
}
