class LogoutResponse {
  bool error;
  List<Data> data;
  String message;
  int iTs;

  LogoutResponse({this.error, this.data, this.message, this.iTs});

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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

class Data {
  int trialId;
  String trialName;

  Data({this.trialId, this.trialName});

  Data.fromJson(Map<String, dynamic> json) {
    trialId = json['trial_id'];
    trialName = json['trial_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trial_id'] = this.trialId;
    data['trial_name'] = this.trialName;
    return data;
  }
}