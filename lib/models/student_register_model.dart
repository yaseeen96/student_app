class StudentRegisterModel {
  String? email;
  String? studentName;
  String? usn;
  String? department;
  String? semester;
  String? password;

  StudentRegisterModel(
      {this.email,
      this.studentName,
      this.usn,
      this.department,
      this.semester,
      this.password});

  StudentRegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    studentName = json['studentName'];
    usn = json['usn'];
    department = json['department'];
    semester = json['semester'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['studentName'] = this.studentName;
    data['usn'] = this.usn;
    data['department'] = this.department;
    data['semester'] = this.semester;
    data['password'] = this.password;

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
    );
  }
}
