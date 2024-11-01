class UpdateUserDTO {
  int userId;
  String? userName;
  String? userNameAr;
  String? email;
  String? phone;
  int? age;
  int? userGenderId;
  int? userTypeId;
  int? walletId;
  int? cityId;

  UpdateUserDTO({
    required this.userId,
    this.userName,
    this.userNameAr,
    this.email,
    this.phone,
    this.age,
    this.userGenderId,
    this.userTypeId,
    this.walletId,
    this.cityId,
  });

  // Factory method to create an instance of UpdateUserDTO from JSON
  factory UpdateUserDTO.fromJson(Map<String, dynamic> json) {
    return UpdateUserDTO(
      userId: json['userId'] as int,
      userName: json['userName'] as String?,
      userNameAr: json['userNameAr'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      age: json['age'] as int?,
      userGenderId: json['userGenderId'] as int?,
      userTypeId: json['userTypeId'] as int?,
      walletId: json['walletId'] as int?,
      cityId: json['cityId'] as int?,
    );
  }

  // Method to convert an instance of UpdateUserDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userNameAr': userNameAr,
      'email': email,
      'phone': phone,
      'age': age,
      'userGenderId': userGenderId,
      'userTypeId': userTypeId,
      'walletId': walletId,
      'cityId': cityId,
    };
  }
}
