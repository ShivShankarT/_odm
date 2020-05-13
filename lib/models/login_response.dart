class LoginResponse {
  bool error;
  List<LoginData> data;
  String message;
  int iTs;

  LoginResponse({this.error, this.data, this.message, this.iTs});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<LoginData>();
      json['data'].forEach((v) {
        data.add(new LoginData.fromJson(v));
      });
    }
    message = json['message'];
    iTs = json['_ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['_ts'] = this.iTs;
    return data;
  }
}

class LoginData {
  int otpExpiry;
  String otp;
  String accessToken;

  LoginData({this.otpExpiry, this.otp, this.accessToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    otpExpiry = json['otp_expiry'];
    otp = json['otp'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp_expiry'] = this.otpExpiry;
    data['otp'] = this.otp;
    data['access_token'] = this.accessToken;
    return data;
  }
}