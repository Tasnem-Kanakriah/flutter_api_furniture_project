class UsersModel {
  String firstName;
  String lastName;
  String email;
  String imageProfile;
  
  UsersModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageProfile,
  });
  
  static userFromMap(Map<String, dynamic> map) {
    return UsersModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      imageProfile: map['imageProfile'],
    );
  }

}
