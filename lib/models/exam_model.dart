class ExamModel {
  int id;
  String filePath;
  String creationDate;
  String name;
  dynamic patient;
  dynamic appointment;

  ExamModel(
      {this.id,
      this.filePath,
      this.creationDate,
      this.name,
      this.patient,
      this.appointment});

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
        id: json['id'],
        filePath: json['file_path'],
        creationDate: json['creation_date'],
        name: json['name'],
        patient: json['patient'],
        appointment: json['appointment']);
  }
}
