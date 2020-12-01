class PatientModel {
  int id;
  String name;
  String email;
  String birthDate;
  String contact;
  String uid;

  PatientModel(
      {this.id, this.name, this.email, this.birthDate, this.contact, this.uid});

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        birthDate: json['birth_date'],
        contact: json['contact'],
        uid: json['uid']);
  }
}
