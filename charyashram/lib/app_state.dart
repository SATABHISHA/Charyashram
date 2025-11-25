import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentOrderId = '';
  String get currentOrderId => _currentOrderId;
  set currentOrderId(String value) {
    _currentOrderId = value;
  }

  String _paymentUrl = '';
  String get paymentUrl => _paymentUrl;
  set paymentUrl(String value) {
    _paymentUrl = value;
  }
}
