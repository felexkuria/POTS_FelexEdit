final String patientTable = "patientTable";

class PatientFields {
  static List<String> values = [
    columnId,
    colAge,
    colSupineHeartRate,
    colStatus,
    colIsChecked
  ];
  static final String columnId = "id";
  static final String colAge = "age";
  static final String colSupineHeartRate = "supineHeart";
  static final String colStatus = "status";
  static final String colIsChecked = "isChecked";
}

class Patient {
  final int age;
  final int supineHeartRate;
  final int isChecked;
  final int? id;
  final int status; //0 for incomplete or 1 for complete
  Patient({
    this.id,
    required this.age,
    required this.supineHeartRate,
    required this.isChecked,
    required this.status,
  });
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    map["id"] = id;

    map["age"] = age;
    map["isChecked"] = isChecked;
    map["status"] = status;
    map["supineHeart"] = supineHeartRate;
    return map;
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
        id: map["id"],
        age: map["age"],
        supineHeartRate: map["supineHeart"],
        isChecked: map["isChecked"],
        status: map["status"]);
  }

  // Patient copy({int? id, int? status, bool? isChecked, int? supineHeartRate}) =>
  //     Patient(
  //       id: id ?? this.id,
  //       status: status ?? this.status,
  //       supineHeartRate: supineHeartRate ?? this.supineHeartRate,
  //       isChecked: isChecked ?? this.isChecked,
  //       age: age ,
  //     );
  static Patient fromJson(Map<String, Object?> json) => Patient(
        id: json[PatientFields.columnId] as int?,
        age: json[PatientFields.colAge] as int,
        supineHeartRate: json[PatientFields.colSupineHeartRate] as int,
        isChecked: json[PatientFields.colIsChecked] as int,
        status: json[PatientFields.colStatus] as int,
      );
  //
  // Map<String, Object?> toJson() => {
  //       PatientFields.columnId: id,
  //       PatientFields.colAge: age,
  //       PatientFields.colSupineHeartRate: supineHeartRate,
  //       PatientFields.colStatus: status,
  //       PatientFields.colIsChecked: isChecked ? 1 : 0,
  //     };
}
