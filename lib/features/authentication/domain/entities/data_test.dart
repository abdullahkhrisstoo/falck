class AuthUser {
  final String email;
  final String phoneNumber;
  final String token;

  AuthUser({
    required this.email,
    required this.phoneNumber,
    required this.token,
  });

  // Optionally, if you need to convert to/from JSON elsewhere:
  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      email: json['email'],
      phoneNumber: json['phone_number'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone_number': phoneNumber,
      'token': token,
    };
  }
}


class OtpCode {
  final String otp;
  final String emailOrPhone;

  OtpCode({
    required this.otp,
    required this.emailOrPhone,
  });
}
