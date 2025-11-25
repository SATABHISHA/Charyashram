// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webviewx_plus/webviewx_plus.dart'; // Works on all platforms
import 'package:go_router/go_router.dart';
import 'dart:developer' as developer;

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({
    super.key,
    required this.paymentUrl,
    this.width,
    this.height,
  });

  final String paymentUrl;
  final double? width;
  final double? height;

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewXController webviewController;
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: WebViewX(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        initialContent: widget.paymentUrl,
        initialSourceType: SourceType.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) => webviewController = controller,
        onPageStarted: (url) => _handleUrlChange(url),
        onPageFinished: (url) => _handleUrlChange(url),
      ),
    );
  }

  /// Detect URL changes to determine success or failure and navigate accordingly
  void _handleUrlChange(String url) {
    if (_hasNavigated) return;

    // Log URL for debugging
    developer.log('WebView URL Changed: $url', name: 'PaymentWebView');

    // Check for payment success URLs based on your API structure
    if (_isPaymentSuccess(url)) {
      _hasNavigated = true;
      developer.log('Payment Success Detected - Navigating to familyDashboard',
          name: 'PaymentWebView');

      // Navigate to familyDashboard route using GoRouter
      context.go('/familyDashboard');
    } else if (_isPaymentFailure(url)) {
      _hasNavigated = true;
      developer.log('Payment Failure Detected - Showing error',
          name: 'PaymentWebView');

      // Navigate to familyDashboard and show error dialog
      context.go('/familyDashboard');
      // Show error message
      _showPaymentFailureDialog();
    }
  }

  /// Check if URL indicates payment success
  bool _isPaymentSuccess(String url) {
    final successIndicators = [
      'payment-success', // Your /razorpay/payment-success endpoint
      'success=true', // Query parameter
      'status=paid', // Status parameter
      'payment_status=completed', // Alternative status
      'transaction_status=success',
    ];

    return successIndicators.any(
        (indicator) => url.toLowerCase().contains(indicator.toLowerCase()));
  }

  /// Check if URL indicates payment failure
  bool _isPaymentFailure(String url) {
    final failureIndicators = [
      'payment-failure', // Failure endpoint
      'razorpay/cancel', // Your /razorpay/cancel endpoint
      'failed=true', // Query parameter
      'status=failed', // Status parameter
      'payment_status=failed', // Alternative status
      'transaction_status=failed',
      'error=payment_failed',
    ];

    return failureIndicators.any(
        (indicator) => url.toLowerCase().contains(indicator.toLowerCase()));
  }

  /// Show payment failure dialog
  void _showPaymentFailureDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Payment Failed',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).error,
                ),
          ),
          content: Text(
            'Sorry, there was an issue processing your payment. Please try again.',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to previous page
              },
              child: Text(
                'Try Again',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                    ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                context.go('/familyDashboard'); // Go to dashboard anyway
              },
              child: Text(
                'Go to Dashboard',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up resources
    super.dispose();
  }
}
