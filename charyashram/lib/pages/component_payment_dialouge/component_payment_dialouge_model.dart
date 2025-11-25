import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'component_payment_dialouge_widget.dart'
    show ComponentPaymentDialougeWidget;
import 'package:flutter/material.dart';

class ComponentPaymentDialougeModel
    extends FlutterFlowModel<ComponentPaymentDialougeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // Stores action output result for [Backend Call - API (RazorPayGetOrder)] action in Button widget.
  ApiCallResponse? apiResultrofOrder;

  // Calculation methods
  double parseAmount(String? text) {
    if (text == null || text.isEmpty) return 0.0;
    return double.tryParse(text) ?? 0.0;
  }

  // Member 1 (Himaant Singh) calculations
  double get member1Total {
    // Only sum the 5 distributed fields, not the main ishtabhriti field
    double swastayani = parseAmount(textController2?.text);
    double dakshina = parseAmount(textController3?.text);
    double sangathani = parseAmount(textController4?.text);
    double pronami = parseAmount(textController5?.text);
    double ritwikee = parseAmount(textController6?.text);
    return swastayani + dakshina + sangathani + pronami + ritwikee;
  }

  // Member 2 (Priya Sharma) calculations
  double get member2Total {
    // Only sum the 5 distributed fields, not the main ishtabhriti field
    double swastayani = parseAmount(textController8?.text);
    double dakshina = parseAmount(textController9?.text);
    double sangathani = parseAmount(textController10?.text);
    double pronami = parseAmount(textController11?.text);
    double ritwikee = parseAmount(textController12?.text);
    return swastayani + dakshina + sangathani + pronami + ritwikee;
  }

  // Summary totals
  double get totalSwastayani => parseAmount(textController2?.text) + parseAmount(textController8?.text);
  double get totalDakshina => parseAmount(textController3?.text) + parseAmount(textController9?.text);
  double get totalSangathani => parseAmount(textController4?.text) + parseAmount(textController10?.text);
  double get totalPronami => parseAmount(textController5?.text) + parseAmount(textController11?.text);
  double get totalRitwikee => parseAmount(textController6?.text) + parseAmount(textController12?.text);
  double get totalIshtabhriti => parseAmount(textController1?.text) + parseAmount(textController7?.text);

  double get grandTotal => member1Total + member2Total;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();

    textFieldFocusNode10?.dispose();
    textController10?.dispose();

    textFieldFocusNode11?.dispose();
    textController11?.dispose();

    textFieldFocusNode12?.dispose();
    textController12?.dispose();
  }
}
