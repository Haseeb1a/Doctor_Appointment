class AppointmentModel {
  String userId;           // New field for user ID
  String doctorId;         // New field for doctor ID
  String doctorName;
  String username;
  String status;
  String place;
  String category;
  String qualification;
  String message;
  String time;
  
  AppointmentModel({
    required this.userId,   // Include userId in the constructor
    required this.doctorId, // Include doctorId in the constructor
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
  factory AppointmentModel.fromMap( map) {
    return AppointmentModel(
      userId: map['userId'], // Map the userId field
      doctorId: map['doctorId'], // Map the doctorId field
      doctorName: map['doctorName'],
      username: map['username'],
      status: map['status'],
      place: map['place'],
      category: map['category'],
      qualification: map['qualification'],
      message: map['message'],
      time: map['time'],
    );
  }

  // Method for converting an instance to a map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,     // Add userId to the map
      'doctorId': doctorId, // Add doctorId to the map
      'doctorName': doctorName,
      'username': username,
      'status': status,
      'place': place,
      'category': category,
      'qualification': qualification,
      'time': time,
      'message': message
    };
  }

  // Method for converting an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,     // Add userId to the JSON map
      'doctorId': doctorId, // Add doctorId to the JSON map
      'doctorName': doctorName,
      'username': username,
      'status': status,
      'place': place,
      'category': category,
      'qualification': qualification,
      'time': time,
      'message': message
    };
  }
}
