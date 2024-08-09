import 'package:flutter/material.dart';
import 'package:medical_tour/utils/analytics_manager.dart';
import 'package:medical_tour/utils/constants.dart';
import 'dart:html';
import 'package:universal_html/js.dart' as html;

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});
  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AnalyticsManager.instance.logAmplitudeEvent(
      "Payment Success",
      amount: "10",
    );
    html.context.callMethod('fbq', ['trackCustom', 'PaymentSuccess']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://media.crafto.app/test/225x225/6f2c2160-b32d-46f9-a413-21daf1adad2a?dimension=225x225',
                height: 80,
              ),
              const SizedBox(height: 16),
              const Text(
                "Your booking is successful, we will get back with the travel plan in 24hrs.",
                textAlign: TextAlign.center,
              ),
              // InkWell(
              //   onTap: () {
              //     window.close();
              //   },
              //   child: Container(
              //     margin: const EdgeInsets.only(top: 16),
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              //     decoration: BoxDecoration(
              //       color: Constants.primary,
              //       borderRadius: BorderRadius.circular(16),
              //     ),
              //     child: const Text(
              //       "Ok",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
