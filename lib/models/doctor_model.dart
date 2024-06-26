class DoctorModel {
  final String about;
  final String category;
  final String id;
  final String name;
  final String place;
  final String qualifications;
  final String workingStartTime; // New field for working start time
  final String workEndingTime; // New field for working end time
  final String phone;
  final bool isDoctor;
  final String gender; // Field for gender
  final bool isActive; // New field for isActive

  DoctorModel({
    required this.about,
    required this.category,
    required this.id,
    required this.name,
    required this.place,
    required this.qualifications,
    required this.workingStartTime, // Added workingStartTime to constructor
    required this.workEndingTime, // Added workEndingTime to constructor
    required this.phone,
    required this.isDoctor,
    required this.gender, // Added gender to constructor
    required this.isActive, // Added isActive to constructor
  });

  // Factory method to create a DoctorModel instance from a map (e.g., from Firestore)
  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      about: map['about'] ?? '',
      category: map['category'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      place: map['place'] ?? '',
      qualifications: map['qualifications'] ?? '',
      workingStartTime: map['workingStartTime'] ?? '', // Retrieve workingStartTime from map
      workEndingTime: map['workEndingTime'] ?? '', // Retrieve workEndingTime from map
      phone: map['phone'] ?? '',
      isDoctor: map['isDoctor'] ?? false,
      gender: map['gender'] ?? '', // Retrieve gender from map
      isActive: map['isActive'] ?? false, // Retrieve isActive from map
    );
  }

  // Method to convert a DoctorModel instance to a map (e.g., for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'about': about,
      'category': category,
      'id': id,
      'name': name,
      'place': place,
      'qualifications': qualifications,
      'workingStartTime': workingStartTime, // Include workingStartTime in the map
      'workEndingTime': workEndingTime, // Include workEndingTime in the map
      'phone': phone,
      'isDoctor': isDoctor,
      'gender': gender, // Include gender in the map
      'isActive': isActive, // Include isActive in the map
    };
  }
}
