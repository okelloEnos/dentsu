class Profile{

String? id;
  final String? firstName;
final String? middleName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? profileImage;

  final String? location;

  Profile({this.id, this.firstName, this.middleName, this.lastName, this.email, this.phoneNumber, this.profileImage, this.location});

  factory Profile.fromJson(Map<Object?, Object?> json) {
    return Profile(
      id: "${json['id']}",
      firstName: "${json['firstName']}",
      middleName: "${json['middleName']}",
      lastName: "${json['lastName']}",
      email: "${json['email']}",
      phoneNumber: "${json['phoneNumber']}",
      profileImage: "${json['profileImage']}",
      location: "${json['location']}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'location': location,
    };
  }

  Profile copyWith({
    String? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profileImage,
    String? location,
  }) {
    return Profile(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      location: location ?? this.location,
    );
  }
}