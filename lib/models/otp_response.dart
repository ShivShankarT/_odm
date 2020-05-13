class OtpResponse {
  bool error;
  List<Data> data;
  int iTs;

  OtpResponse({this.error, this.data, this.iTs});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    iTs = json['_ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['_ts'] = this.iTs;
    return data;
  }
}

class Data {
  int userId;
  String fname;
  String lname;
  String email;
  String mobile;
  String createdOn;
  String env;
  List<String> permissions;

  Data(
      {this.userId,
        this.fname,
        this.lname,
        this.email,
        this.mobile,
        this.createdOn,
        this.env,
        this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    mobile = json['mobile'];
    createdOn = json['created_on'];
    env = json['env'];
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['created_on'] = this.createdOn;
    data['env'] = this.env;
    data['permissions'] = this.permissions;
    return data;
  }
}