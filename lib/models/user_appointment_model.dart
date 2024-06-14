class AppointmentModel {
  String doctorName;
  String username;
  String status;
  String place;
  String category;
  String qualification;
  String message;
  String time;
  

  AppointmentModel({
    required this.doctorName,
    required this.username,
    required this.status,
    required this.place,
    required this.category,
    required this.qualification,
    required this.time,
    required this.message
  });

  // Factory constructor for creating an instance from a map
  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      
      doctorName: map['doctorName'],
      username: map['username'],
      status: map['status'],
      place: map['place'],
      category: map['category'],
      qualification: map['qualification'],
      message:  map['message'],
      time:map['time'],
    );
  }

  // Method for converting an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'doctorName': doctorName,
      'username': username,
      'status': status,
      'place': place,
      'category': category,
      'qualification': qualification,
      'time': time,
      "message":message
    };
  }

   Map<String, dynamic> toJson() {
    return {
      'doctorName': doctorName,
      'username': username,
      'status': status,
      'place': place,
      'category': category,
      'qualification': qualification,
      'time': time,
      'message': message,
    };
  }
}
