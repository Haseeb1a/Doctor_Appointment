class DoctorModel {
  final String about;
  final String category;
  final String id;
  final String name;
  final String place;
  final String qualifications;
  final String workingTime;
  final String phone;

  DoctorModel({
    required this.about,
    required this.category,
    required this.id,
    required this.name,
    required this.place,
    required this.qualifications,
    required this.workingTime,
    required this.phone,
  });

  // Factory method to create a User instance from a map (e.g., from Firestore)
  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      about: map['about'] ?? '',
      category: map['category'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      place: map['place'] ?? '',
      qualifications: map['qualifications'] ?? '',
      workingTime: map['workingTime'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  // Method to convert a User instance to a map (e.g., for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'about': about,
      'category': category,
      'id': id,
      'name': name,
      'place': place,
      'qualifications': qualifications,
      'workingTime': workingTime,
      'phone': phone,
    };
  }
}
