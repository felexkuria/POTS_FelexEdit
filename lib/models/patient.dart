import 'dart:convert';

final String patientTable = "patientTable";

class PatientFields {
  static List<String> values = [
    columnId,
    colAge,
    colSupineHeartRate,
    colStatus
  ];
  static final String columnId = "id";
  static final String colAge = "age";
  static final String colSupineHeartRate = "supineHeartRate";
  static final String colStatus = "status";
  static final String colIsChecked = "checked";
}

class Patient {
  final int age;
  final int supineHeartRate;
  final bool isChecked;
  final int? id;
  final int status; //0 for incomplete or 1 for complete
  const Patient({
    this.id,
    required this.age,
    required this.supineHeartRate,
    required this.isChecked,
    required this.status,
  });
  Patient copy({int? id, int? status, bool? isChecked, int? supineHeartRate}) =>
      Patient(
        id: id ?? this.id,
        status: status ?? this.status,
        supineHeartRate: supineHeartRate ?? this.supineHeartRate,
        isChecked: isChecked ?? this.isChecked,
        age: age ?? this.age,
      );
  static Patient fromJson(Map<String, Object?> json) => Patient(
        id: json[PatientFields.columnId] as int?,
        age: json[PatientFields.colAge] as int,
        supineHeartRate: json[PatientFields.colSupineHeartRate] as int,
        isChecked: json[PatientFields.colIsChecked] == 1,
        status: json[PatientFields.colStatus] as int,
      );

  Map<String, Object?> toJson() => {
        PatientFields.columnId: id,
        PatientFields.colAge: age,
        PatientFields.colSupineHeartRate: supineHeartRate,
        PatientFields.colStatus: status,
        PatientFields.colIsChecked: isChecked ? 1 : 0,
      };
}
