class CreateUserDTO {
  String? userName;
  String? userNameAr;
  String? email;
  String? password;
  String? phone;
  int? age;
  int? userGenderId;
  int? userTypeId;
  int? walletId;
  int? cityId;

  CreateUserDTO({
    this.userName,
    this.userNameAr,
    this.email,
    this.password,
    this.phone,
    this.age,
    this.userGenderId,
    this.userTypeId,
    this.walletId,
    this.cityId,
  });

  // Factory method to create an instance of CreateUserDTO from JSON
  factory CreateUserDTO.fromJson(Map<String, dynamic> json) {
    return CreateUserDTO(
      userName: json['userName'] as String?,
      userNameAr: json['userNameAr'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      age: json['age'] as int?,
      userGenderId: json['userGenderId'] as int?,
      userTypeId: json['userTypeId'] as int?,
      walletId: json['walletId'] as int?,
      cityId: json['cityId'] as int?,
    );
  }

  // Method to convert an instance of CreateUserDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userNameAr': userNameAr,
      'email': email,
      'password': password,
      'phone': phone,
      'age': age,
      'userGenderId': userGenderId,
      'userTypeId': userTypeId,
      'walletId': walletId,
      'cityId': cityId,
    };
  }
}
