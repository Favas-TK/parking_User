import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Paymentt extends StatefulWidget {
  const Paymentt({super.key});

  @override
  State<Paymentt> createState() => _PaymenttState();
}

class _PaymenttState extends State<Paymentt> {
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      _handlePaymentSuccess,
    );
    _razorpay.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      _handlePaymentSuccess,
    );
    _razorpay.on(
      Razorpay.EVENT_EXTERNAL_WALLET,
      _handlePaymentSuccess,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 300.h,
        height: 50.h,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          highlightElevation: 0,
          textColor: Colors.white,
          color: const Color.fromARGB(255, 235, 219, 174),
          child: const Text(
            'Confirm Payment',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: openCheckOut,
        ),
      ),
    );

    //  ElevatedButton(
    //   onPressed: openCheckOut,
    //   child: const Text('Pay'),
    // );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: 'SUCCESS: ' + response.paymentId!,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: 'ERROR :${response.code} - ${response.message!}',
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: 'EXTERNAL_WALLET :${response.walletName!}',
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void openCheckOut() async {
    var options = {
      'key': 'rzp_test_g5T08D44TcPGMD',
      'amount': 100.00,
      'name': 'favaas enterprenours',
      'dscripton': 'google CEO',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9048235653', 'email': 'mfavastk123@gmail.com'},
      'external': {
        'wallets': ['paytm'],
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
}
