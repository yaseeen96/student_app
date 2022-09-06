class StudentLoginModel {
  String? email;
  String? token;

  StudentLoginModel({
    this.email,
    this.token,
  });

  StudentLoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }

  factory StudentLoginModel.fromMap(Map<String, dynamic> map) {
    return StudentLoginModel(
      email: map['email']?.toString() ?? '',
      token: map['token']?.toString() ?? '',
    );
  }
}
