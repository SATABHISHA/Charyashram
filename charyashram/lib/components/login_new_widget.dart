import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// 'dart:convert' is provided transitively by '/flutter_flow/flutter_flow_util.dart', so remove duplicate import
import 'package:http/http.dart' as http;
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// Duplicate and unused imports removed to fix analyzer warnings
import 'login_new_model.dart';
export 'login_new_model.dart';

/// New Component Gen
class LoginNewWidget extends StatefulWidget {
  const LoginNewWidget({super.key});

  @override
  State<LoginNewWidget> createState() => _LoginNewWidgetState();
}

class _LoginNewWidgetState extends State<LoginNewWidget> {
  late LoginNewModel _model;
  late FocusNode _checkboxFocusNode;
  List<Map<String, String>> _templeList = [];
  bool _loadingTemples = true;
  String? _loginError;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginNewModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _loadRememberedCredentials();
    _fetchTempleList();
    _checkboxFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));

  }

  Future<void> _fetchTempleList() async {
    try {
      final httpResponse = await http.get(Uri.parse('https://wrkplan-temp-api.in/temple/list'));
      if (httpResponse.statusCode == 200) {
        final List<dynamic> temples = jsonDecode(httpResponse.body);
        setState(() {
          _templeList = temples.map<Map<String, String>>((t) => {
            'name': t['name'],
            'code': t['code'],
          }).toList();
          _loadingTemples = false;
        });
      } else {
        setState(() { _loadingTemples = false; });
      }
    } catch (e) {
      setState(() { _loadingTemples = false; });
    }
  }

  Future<void> _login() async {
    setState(() { _loginError = null; });
    final selectedTemple = _model.dropDownValue;
    final familyCode = _model.textController1?.text ?? '';
    final password = _model.textController2?.text ?? '';
    if (selectedTemple == null || familyCode.isEmpty || password.isEmpty) {
      setState(() { _loginError = 'Please fill all fields.'; });
      return;
    }
    final templeCode = selectedTemple.split(' - ').last;
    try {
      final response = await http.post(
        Uri.parse('https://wrkplan-temp-api.in/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'templeCode': templeCode,
          'familyCode': familyCode,
          'password': password,
        }),
      );
      debugPrint('Login response status: ${response.statusCode}');
      debugPrint('Login response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> respJson = jsonDecode(response.body);
        debugPrint('Parsed JSON: $respJson');
        final token = respJson['token']?.toString() ?? '';
        if (token.isNotEmpty) {
          // Persist auth token & user info for later use
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          if (respJson.containsKey('userAuth')) {
            await prefs.setString('userAuth', jsonEncode(respJson['userAuth']));
          }
          // Set token in ApiManager so subsequent requests include it automatically
          ApiManager.setAccessToken(token);
          if (_model.checkboxValue == true) {
            await _saveCredentials(selectedTemple, familyCode, password);
          } else {
            await _clearSavedCredentials();
          }
          setState(() { _loginError = null; });
          if (!mounted) return;
          context.pushNamed(FamilyDashboardWidget.routeName);
        } else {
          setState(() { _loginError = 'Incorrect login.'; });
        }
      } else {
        // Try to extract server message if provided
        try {
          final Map<String, dynamic> errJson = jsonDecode(response.body);
          final errMsg = errJson['message'] ?? 'Incorrect login.';
          setState(() { _loginError = errMsg; });
        } catch (_) {
          setState(() { _loginError = 'Incorrect login.'; });
        }
      }
    } catch (e) {
      setState(() { _loginError = 'Login failed.'; });
    }
  }

  Future<void> _saveCredentials(String temple, String family, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('temple', temple);
    await prefs.setString('family', family);
    await prefs.setString('password', password);
  }

  Future<void> _clearSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('temple');
    await prefs.remove('family');
    await prefs.remove('password');
  }

  Future<void> _loadRememberedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final temple = prefs.getString('temple');
    final family = prefs.getString('family');
    final password = prefs.getString('password');
    if (temple != null && family != null && password != null) {
      setState(() {
        _model.dropDownValue = temple;
        _model.textController1?.text = family;
        _model.textController2?.text = password;
        _model.checkboxValue = true;
      });
    }
  }
  // removed extra closing brace

  @override
  void dispose() {
    _checkboxFocusNode.dispose();
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        elevation: 7.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: 320.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.person,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temple Management',
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          'Black Bison',
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Temple',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.inter(
                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                  ),
                ),
                _loadingTemples
                    ? Center(child: CircularProgressIndicator())
                    : FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??= FormFieldController<String>(null),
                        options: _templeList.map((t) => '${t['name']} - ${t['code']}').toList(),
                        onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
                        width: 272.0,
                        height: 40.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          color: const Color(0xFF14181B),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        hintText: '---Select Any---',
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 15.0,
                        ),
                        fillColor: const Color(0xFFF1F4F8),
                        elevation: 0.0,
                        borderColor: const Color(0xFFE0E3E7),
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode1,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: const Color(0xFF14181B),
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    alignLabelWithHint: true,
                    hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.inter(
                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      color: const Color(0xFF777777),
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE0E3E7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: const Color(0xFF14181B),
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  validator: _model.textController1Validator.asValidator(context),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  width: 272.0,
                  child: TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    autofocus: false,
                    obscureText: !_model.passwordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: const Color(0xFF14181B),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      alignLabelWithHint: true,
                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                        color: const Color(0xFF7A7D7D),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE0E3E7),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 12.0),
                      suffixIcon: InkWell(
                        onTap: () => safeSetState(() => _model.passwordVisibility = !_model.passwordVisibility),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _model.passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: const Color(0xFF57636C),
                          size: 22.0,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: const Color(0xFF14181B),
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    validator: _model.textController2Validator.asValidator(context),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FocusableActionDetector(
                          focusNode: _checkboxFocusNode,
                          autofocus: false,
                          actions: {
                            ActivateIntent: CallbackAction(onInvoke: (e) => safeSetState(() => _model.checkboxValue = !(_model.checkboxValue ?? false))),
                          },
                          shortcuts: <LogicalKeySet, Intent>{
                            LogicalKeySet(LogicalKeyboardKey.space): ActivateIntent(),
                            LogicalKeySet(LogicalKeyboardKey.enter): ActivateIntent(),
                          },
                          child: Semantics(
                            label: 'Remember me',
                            checked: _model.checkboxValue ?? false,
                            button: true,
                            onTap: () => safeSetState(() => _model.checkboxValue = !(_model.checkboxValue ?? false)),
                            child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: (_model.checkboxValue ?? false) ? FlutterFlowTheme.of(context).primary : Colors.transparent,
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(
                                color: (_model.checkboxValue ?? false) ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                child: (_model.checkboxValue ?? false)
                                    ? const Icon(Icons.check, color: Colors.white, size: 16.0, key: ValueKey('checked'))
                                    : const SizedBox(key: ValueKey('unchecked')),
                              ),
                            ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Remember me',
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot Password?',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                _loginError != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          _loginError!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    : SizedBox.shrink(),
                FFButtonWidget(
                  onPressed: _login,
                  text: 'Login',
                  options: FFButtonOptions(
                    width: 272.0,
                    height: 44.0,
                    padding: const EdgeInsets.all(8.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: const Color(0xFF0A0A0A),
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'By logging in, you agree to our Terms & Conditions and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.inter(
                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
