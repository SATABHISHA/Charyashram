import '/components/login_new_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_new_widget.dart' show LoginPageNewWidget;
import 'package:flutter/material.dart';

class LoginPageNewModel extends FlutterFlowModel<LoginPageNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LoginNew component.
  late LoginNewModel loginNewModel;

  @override
  void initState(BuildContext context) {
    loginNewModel = createModel(context, () => LoginNewModel());
  }

  @override
  void dispose() {
    loginNewModel.dispose();
  }
}
