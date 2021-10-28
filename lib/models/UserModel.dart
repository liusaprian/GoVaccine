class UserModel {
  late String? fullName;
  late String email;
  late String? phoneNumber;
  late String? password;
  late String? photoUrl;

  UserModel({
    this.fullName,
    required this.email,
    this.phoneNumber,
    this.password,
    this.photoUrl
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
    };
  }
}