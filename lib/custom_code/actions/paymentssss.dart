// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:razorpay_flutter/razorpay_flutter.dart'; // Razorpay SDK

Future paymentssss() async {
  // Initialize Razorpay
  Razorpay _razorpay = Razorpay();

  // Set up event listeners for Razorpay
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
      (PaymentSuccessResponse response) {
    print("Payment Success: ${response.paymentId}");
    // Here you can trigger additional logic like calling your backend for verification
  });

  _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse response) {
    print("Payment Failed: ${response.code} - ${response.message}");
    // Handle payment error by showing an error message or logging it
  });

  _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
      (ExternalWalletResponse response) {
    print("External Wallet selected: ${response.walletName}");
    // Handle the external wallet case
  });

  // Default values
  double amount = 500.0; // Example: 500 INR
  String contact = '1234567890'; // Default phone number
  String email = 'example@example.com'; // Default email

  // Define options for Razorpay checkout
  var options = {
    'key': 'ajeJ1nQEJZzE6ZyAyuHndaZF', // Replace with your Razorpay Key ID
    'amount': (amount * 100).toInt(), // Amount in the smallest currency unit
    'name': 'Demo Payment',
    'description': 'Payment for order',
    'prefill': {
      'contact': contact,
      'email': email,
    },
    'theme': {
      'color': '#F37254',
    }
  };

  try {
    // Open Razorpay checkout
    _razorpay.open(options);
  } catch (e) {
    print("Error opening Razorpay checkout: $e");
    // Optionally, handle the error
  }

  // Ensure to dispose of the Razorpay instance when done
  _razorpay.clear();
}
