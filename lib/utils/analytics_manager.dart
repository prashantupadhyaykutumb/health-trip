import 'package:amplitude_flutter/amplitude.dart';
import 'package:medical_tour/utils/constants.dart';
import 'dart:html';
import 'dart:js' as js;

class AnalyticsManager {
  static AnalyticsManager? _instance;
  Amplitude amplitude = Amplitude.getInstance(instanceName: "Test");

  AnalyticsManager._();

  static AnalyticsManager get instance {
    return _instance ??= AnalyticsManager._();
  }

  init() async {
    await amplitude.init(Constants.amplitudeApiKey);
    addFbPixelScript();
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

  void addFbPixelScript() {
    // Create a new script element
    ScriptElement fbPixelScript = ScriptElement();
    fbPixelScript.type = 'text/javascript';
    fbPixelScript.defer = true;
    fbPixelScript.async = true;
    fbPixelScript.src = 'https://connect.facebook.net/en_US/fbevents.js';

    // Append the script to the document
    document.head?.append(fbPixelScript);

    // Initialize fbq and track page view
    js.context.callMethod('eval', [
      """
    (function(f,b,e,v,n,t,s) {
      if(f.fbq) return;
      n = f.fbq = function() {
        n.callMethod ? 
        n.callMethod.apply(n, arguments) : n.queue.push(arguments);
      };
      if(!f._fbq) f._fbq = n;
      n.push = n;
      n.loaded = !0;
      n.version = '2.0';
      n.queue = [];
      t = b.createElement(e); 
      t.async = !0;
      t.defer = !0;
      t.src = v; 
      s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t,s);
    })(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '1014144106520847');
    fbq('track', 'PageView');
  """
    ]);
  }
}
