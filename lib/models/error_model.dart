/// This file contains the model that will be used to parse the error response from an API.
class ErrorModel {
  int? statusCode;
  String? message;

  ErrorModel({this.statusCode, this.message});

  Map<String, dynamic> toJson() => {
        "errorCode": statusCode,
        "message": message,
      };

  factory ErrorModel.fromJson(Map<String, dynamic>? data) => ErrorModel(
        statusCode: data?["errorCode"] ?? 000,
        message: data?["message"]?.toString() ?? 'Something went wrong. Please try again later.',
      );
}
