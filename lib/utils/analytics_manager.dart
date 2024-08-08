import 'package:amplitude_flutter/amplitude.dart';
import 'package:medical_tour/utils/constants.dart';

class AnalyticsManager {
  static AnalyticsManager? _instance;
  Amplitude amplitude = Amplitude.getInstance(instanceName: "Test");

  AnalyticsManager._();

  static AnalyticsManager get instance {
    return _instance ??= AnalyticsManager._();
  }

  init() async {
    await amplitude.init(Constants.amplitudeApiKey);
  }

  void logAmplitudeEvent(
    String eventName, {
    String? location,
    String? name,
    String? number,
    String? amount,
    String? value,
    String? type,
    String? email,
  }) {
    amplitude.logEvent(
      eventName,
      eventProperties: {
        "Location": location,
        "Name": name,
        "Number": number,
        "Amount": amount,
        "value": value,
        "Type": type,
        "Email": email,
      },
    );
  }
}