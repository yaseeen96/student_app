class StudentProfileModel {
  String? email;
  String? studentName;
  String? usn;
  String? department;
  String? semester;

  StudentProfileModel(
      {this.email, this.department, this.studentName, this.semester, this.usn});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    studentName = json['studentName'];
    semester = json['semester'];
    department = json['department'];
    usn = json['usn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['usn'] = this.usn;
    data['department'] = this.department;
    data['studentName'] = this.studentName;
    data['semester'] = this.semester;

    return data;
  }

  factory StudentProfileModel.fromMap(Map<String, dynamic> map) {
    return StudentProfileModel(
      email: map['email']?.toString() ?? '',
      studentName: map['studentName']?.toString() ?? '',
      department: map['studentName']?.toString() ?? '',
      semester: map['studentName']?.toString() ?? '',
      usn: map['usn']?.toString() ?? '',
    );
  }
}
