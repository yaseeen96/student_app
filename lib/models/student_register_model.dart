class StudentRegisterModel {
  String? email;
  String? studentName;
  String? usn;
  String? department;
  String? semester;
  String? password;
  String? password2;

  StudentRegisterModel(
      {this.email,
      this.studentName,
      this.usn,
      this.department,
      this.semester,
      this.password,
      this.password2});

  StudentRegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    studentName = json['studentName'];
    usn = json['usn'];
    department = json['department'];
    semester = json['semester'];
    password = json['password'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['studentName'] = this.studentName;
    data['usn'] = this.usn;
    data['department'] = this.department;
    data['semester'] = this.semester;
    data['password'] = this.password;
    data['password2'] = this.password2;

    return data;
  }

  factory StudentRegisterModel.fromMap(Map<String, dynamic> map) {
    return StudentRegisterModel(
      email: map['email']?.toString() ?? '',
      studentName: map['studentName']?.toString() ?? '',
      usn: map['usn']?.toString() ?? '',
      department: map['department']?.toString() ?? '',
      semester: map['semester']?.toString() ?? '',
      password: map['password']?.toString() ?? '',
      password2: map['password2']?.toString() ?? '',
    );
  }
}
