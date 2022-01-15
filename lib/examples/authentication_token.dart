import 'package:http/http.dart' as http;
import 'dart:convert' show json;

const SERVER_IP =
    'https://xplain-usermanagement-appservicee46d9488.azurewebsites.net';

class AuthenticationToken {
  static Future<String> attemptLogIn(String username, String password) async {
    var res = await http.post(
      "$SERVER_IP/auth/login",
      body: json.encode({
        "email": "med.dernoun@gmail.com",
        "password": "21GXv%tdwX0H",
      }),
      headers: {
        "Content-type": "application/json",
        "Accept": "*/*",
      },
    );
    if (res.statusCode == 200) return res.body;
    return null;
  }
}
