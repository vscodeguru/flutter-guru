import 'package:url_launcher/url_launcher.dart';

class luncherHelper {
  Future<bool> launchWhatsapp(String mobileNo) async {
    var url = "whatsapp://send?phone=91$mobileNo";

    bool data = await canLaunch(url);

    if (data) data = await launch(url);
    
    if (data) return Future.value(true);
    
    return Future.value(false);
  }

  Future<bool> launchDialer(String mobileNo) async {
    var url = "tel:+91$mobileNo";

   bool data = await canLaunch(url);

    if (data) data = await launch(url);
    
    if (data) return Future.value(true);
    
    return Future.value(false);
  }

  Future<bool> launchMessager(String mobileNo) async {
    var url = "sms:+91$mobileNo";

    bool data = await canLaunch(url);

    if (data) data = await launch(url);
    
    if (data) return Future.value(true);
    
    return Future.value(false);
  }
}
