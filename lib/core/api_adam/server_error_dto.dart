class ServerErrorDto {
  final String? error;

  ServerErrorDto({this.error});

  factory ServerErrorDto.fromJson(Map<String, dynamic> json) {
    return ServerErrorDto(error: json['error'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'error': error};
  }
}
