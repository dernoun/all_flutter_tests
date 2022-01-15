// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:startup_namer/examples/url_launcher.dart';

// import 'package:startup_namer/screens/json_user.dart';

Future<void> main() async {
  // Map<String, dynamic> decodedToken = JwtDecoder.decode(
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtb2hhbWVkLmRlcm5vdW4iLCJqdGkiOiIwZGJiN2YwNS1iMjZmLTQ1NWUtYTU2Zi1hMzllYTA4OTI2MjciLCJlbWFpbCI6Im1lZC5kZXJub3VuQGdtYWlsLmNvbSIsInVpZCI6IjczYzczNTcxLTdjN2UtNDUyZS05YWM2LWJkM2Q1OWQzMWI1NyIsInRlbmFudGlkIjoiMzg3NDMyREYtOTYxNy00NDZCLUJFQjUtNEMzRDk3QzVGNUUxIiwiZmlyc3RfbmFtZSI6Ik1vaGFtZWQiLCJsYXN0X25hbWUiOiJEZXJub3VuIiwiZnVsbF9uYW1lIjoiTW9oYW1lZCBEZXJub3VuIiwibmJmIjoxNjQwNjk5NTU1LCJleHAiOjE2NDA3MDY3NTUsImlzcyI6IlhwbGFpbkJhY2tlbmQuVXNlck1hbmFnZW1lbnQuU2VydmljZSIsImF1ZCI6IlhwbGFpbkJhY2tlbmQuVXNlck1hbmFnZW1lbnQuU2VydmljZSJ9.NiE6BW6ZlCf77NSxl0gbst7vXvWxhSpJM5hM4CiXsYE');

  // print(decodedToken);

  // print('\n\n\n**********************************\n\n\n');

  // try {
  //   final token = await AuthenticationToken.attemptLogIn('', '');
  //   UserToken userToken = UserToken.fromJson(json.decode(token));
  //   print(userToken);
  // } on HttpException catch (e) {
  //   print(e);
  // }

  runApp(
    MaterialApp(
      home: MyApp(),
    ),
    // MyApp(),
  );
}
