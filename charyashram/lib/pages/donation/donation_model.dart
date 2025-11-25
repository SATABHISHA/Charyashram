import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'donation_widget.dart' show DonationWidget;
import 'package:flutter/material.dart';

class DonationModel extends FlutterFlowModel<DonationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextFieldFamilyCode widget.
  FocusNode? textFieldFamilyCodeFocusNode;
  TextEditingController? textFieldFamilyCodeTextController;
  String? Function(BuildContext, String?)?
      textFieldFamilyCodeTextControllerValidator;
  // State field(s) for TextFieldIndividualAmount widget.
  FocusNode? textFieldIndividualAmountFocusNode;
  TextEditingController? textFieldIndividualAmountTextController;
  String? Function(BuildContext, String?)?
      textFieldIndividualAmountTextControllerValidator;
  // State field(s) for TextFieldAmount widget.
  FocusNode? textFieldAmountFocusNode;
  TextEditingController? textFieldAmountTextController;
  String? Function(BuildContext, String?)?
      textFieldAmountTextControllerValidator;
  // State field(s) for TextFieldDescription widget.
  FocusNode? textFieldDescriptionFocusNode;
  TextEditingController? textFieldDescriptionTextController;
  String? Function(BuildContext, String?)?
      textFieldDescriptionTextControllerValidator;
  // Stores action output result for [Backend Call - API (RazorPayGetOrder)] action in Button widget.
  ApiCallResponse? apiResultrof;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFamilyCodeFocusNode?.dispose();
    textFieldFamilyCodeTextController?.dispose();

    textFieldIndividualAmountFocusNode?.dispose();
    textFieldIndividualAmountTextController?.dispose();

    textFieldAmountFocusNode?.dispose();
    textFieldAmountTextController?.dispose();

    textFieldDescriptionFocusNode?.dispose();
    textFieldDescriptionTextController?.dispose();
  }
}
