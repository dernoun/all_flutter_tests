import 'jwt_decoder_impl.dart';

class TokenBody {
  Data data;
  bool failed;
  String message;
  bool succeeded;

  TokenBody({this.data, this.failed, this.message, this.succeeded});

  TokenBody.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['failed'] = failed;
    data['message'] = message;
    data['succeeded'] = succeeded;
    return data;
  }
}

class Data {
  String accessToken;
  String firebaseToken;
  String id;
  String userName;
  String email;
  bool isVerified;
  String issuedOn;
  String expiresOn;
  String companyName;
  UserToken userToken;

  Data(
      {this.accessToken,
      this.firebaseToken,
      this.id,
      this.userName,
      this.email,
      this.isVerified,
      this.issuedOn,
      this.expiresOn,
      this.companyName,
      this.userToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    firebaseToken = json['firebase_token'];
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    isVerified = json['isVerified'];
    issuedOn = json['issuedOn'];
    expiresOn = json['expiresOn'];
    companyName = json['companyName'];
    userToken = UserToken.fromJson(JwtDecoder.decode(accessToken));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['firebase_token'] = firebaseToken;
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;
    data['isVerified'] = isVerified;
    data['issuedOn'] = issuedOn;
    data['expiresOn'] = expiresOn;
    data['companyName'] = companyName;
    return data;
  }
}

class UserToken {
  String sub;
  String jti;
  String email;
  String uid;
  String tenantid;
  String firstName;
  String lastName;
  String fullName;
  int nbf;
  int exp;
  String iss;
  String aud;

  UserToken(
      {this.sub,
      this.jti,
      this.email,
      this.uid,
      this.tenantid,
      this.firstName,
      this.lastName,
      this.fullName,
      this.nbf,
      this.exp,
      this.iss,
      this.aud});

  UserToken.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    jti = json['jti'];
    email = json['email'];
    uid = json['uid'];
    tenantid = json['tenantid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    nbf = json['nbf'];
    exp = json['exp'];
    iss = json['iss'];
    aud = json['aud'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub'] = sub;
    data['jti'] = jti;
    data['email'] = email;
    data['uid'] = uid;
    data['tenantid'] = tenantid;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['nbf'] = nbf;
    data['exp'] = exp;
    data['iss'] = iss;
    data['aud'] = aud;
    return data;
  }
}
