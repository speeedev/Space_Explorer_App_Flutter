class ResponseModel {
  final String? message;
  final bool? isError;
  final dynamic data;
  
  ResponseModel({
    this.message,
    this.isError,
    this.data,
  });

  ResponseModel copyWith({
    String? message,
    bool? isError,
    dynamic data,
  }) {
    return ResponseModel(
      message: message ?? this.message,
      isError: isError ?? this.isError,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'isError': isError,
      'data': data,
    };
  }
}