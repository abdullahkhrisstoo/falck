class UserDTO {
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
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  UserDTO({
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
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of UserDTO from JSON
  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
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
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UserDTO to JSON
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
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
