class User {
  String userId;
  String fname;
  String lname;
  bool isActive;

  User({this.userId, this.fname, this.lname, this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fname = json['fname'];
    lname = json['lname'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['is_active'] = this.isActive;
    return data;
  }
}