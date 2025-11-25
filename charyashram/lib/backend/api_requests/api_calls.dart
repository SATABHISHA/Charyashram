import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start CashFreePaymentsApi Group Code

class CashFreePaymentsApiGroup {
  static String getBaseUrl() => 'https://ourprojectapi.sroy.es/public/api/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetOrderCall getOrderCall = GetOrderCall();
  static GetUserPaymentsCall getUserPaymentsCall = GetUserPaymentsCall();
  static RazorPayGetOrderCall razorPayGetOrderCall = RazorPayGetOrderCall();
}

class GetOrderCall {
  Future<ApiCallResponse> call({
    double? amount,
    String? userId = '',
    String? description = '',
  }) async {
    final baseUrl = CashFreePaymentsApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amount": $amount,
  "user_id": "${escapeStringForJson(userId)}",
  "description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetOrder',
      apiUrl: '${baseUrl}payment/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? dataOrderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.order_id''',
      ));
  String? dataCfOrderId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.cf_order_id''',
      ));
  String? dataPaymentSessionId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.payment_session_id''',
      ));
  int? dataAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.amount''',
      ));
  String? dataCurrency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.currency''',
      ));
  String? dataPaymentUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.payment_url''',
      ));
}

class GetUserPaymentsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = CashFreePaymentsApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetUserPayments',
      apiUrl: '${baseUrl}payment/user-payments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? dataOrderid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].order_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dataAmount(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dataCurrency(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].currency''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dataStatus(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? dataPaymentMethod(dynamic response) => getJsonField(
        response,
        r'''$.data[:].payment_method''',
        true,
      ) as List?;
  List<String>? dataDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? dataCreatedat(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? dataPaidat(dynamic response) => getJsonField(
        response,
        r'''$.data[:].paid_at''',
        true,
      ) as List?;
}

class RazorPayGetOrderCall {
  Future<ApiCallResponse> call({
    int? userId,
    double? amount,
    String? description = '',
  }) async {
    final baseUrl = CashFreePaymentsApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": $userId,
  "amount": $amount,
  "description": "${escapeStringForJson(description)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RazorPayGetOrder',
      apiUrl: '${baseUrl}payment/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  String? orderid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.order_id''',
      ));
  String? razorpayorderid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.razorpay_order_id''',
      ));
  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.currency''',
      ));
  String? paymenturl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.payment_url''',
      ));
  String? razorpaykeyid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.razorpay_key_id''',
      ));
  String? gateway(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.gateway''',
      ));
  dynamic razorpayresponse(dynamic response) => getJsonField(
        response,
        r'''$.data.razorpay_response''',
      );
  int? razorpayresponseamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.razorpay_response.amount''',
      ));
  int? amountdue(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.razorpay_response.amount_due''',
      ));
  int? amountpaid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.razorpay_response.amount_paid''',
      ));
  int? attempts(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.razorpay_response.attempts''',
      ));
  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.amount''',
      ));
  int? createdat(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.razorpay_response.created_at''',
      ));
  String? razorpayresponsecurrency(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.razorpay_response.currency''',
      ));
  String? entity(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.razorpay_response.entity''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.razorpay_response.id''',
      ));
  dynamic razorpayresponsenotes(dynamic response) => getJsonField(
        response,
        r'''$.data.razorpay_response.notes''',
      );
  String? razorpayresponsenotesdescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.razorpay_response.notes.description''',
      ));
  String? razorpayresponsestatus(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.razorpay_response.status''',
      ));
}

/// End CashFreePaymentsApi Group Code

class CreateCashFreeOrderCall {
  static Future<ApiCallResponse> call({
    double? orderAmount,
    String? orderCurrency = '',
    String? customerId = '',
    String? customerPhone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "order_currency": "${escapeStringForJson(orderCurrency)}",
  "order_amount": $orderAmount,
  "customer_details": {
    "customer_id": "${escapeStringForJson(customerId)}",
    "customer_phone": "${escapeStringForJson(customerPhone)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateCashFreeOrder',
      apiUrl: 'https://sandbox.cashfree.com/pg/orders',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-api-version': '2023-08-01',
        'x-client-id': 'TEST1082458904c66cd2bbf7711c938598542801',
        'x-client-secret': 'SECURE_SECRET_PLACEHOLDER',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
