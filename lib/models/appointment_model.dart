class AppointmentModel {
  int id;
  String title;
  String date;
  String symptom;
  String diagnosis;
  String medication;
  dynamic patient;
  dynamic doctor;

  AppointmentModel(
      {this.id,
      this.title,
      this.date,
      this.symptom,
      this.diagnosis,
      this.medication,
      this.patient,
      this.doctor});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        symptom: json['symptom'],
        diagnosis: json['diagnosis'],
        medication: json['medication'],
        patient: json['patient'],
        doctor: json['doctor']);
  }
}
