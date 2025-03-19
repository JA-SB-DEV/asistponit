class AttendanceModel {
  final String id;
  final String date;
  final String checkIn;
  final String? checkOut;
  final DateTime createAt;
  final Map? checkInLocation;
  final Map? checkOutLocation;

  AttendanceModel(
      {required this.id,
      required this.date,
      required this.checkIn,
      this.checkOut,
      required this.createAt,
      this.checkInLocation,
      this.checkOutLocation
      });

  factory AttendanceModel.fromJson(Map<String, dynamic> data){
    return AttendanceModel(
      id: data['employee_id'], 
      date: data['date'], 
      checkIn: data['check_in'],
      checkOut: data['check_out'],
      createAt: DateTime.parse(data['created_at']),
      checkInLocation: data['check_in_location'],
      checkOutLocation: data['check_in_location'],
      );
  }
}
