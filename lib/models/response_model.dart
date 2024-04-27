import 'package:busha_assessment/models/error_model.dart';

/// This file contains the model that will be used to parse the response from an API.
class ResponseModel<T> {
  ErrorModel? errorModel = ErrorModel();
  int? statusCode;
  String? message;
  String? token;
  T? data;
  bool? valid;

  ResponseModel({
    this.errorModel,
    this.message,
    this.statusCode,
    this.token,
    this.data,
    this.valid,
  });

  Map<String, dynamic> toJson() => {
        "errorModel": errorModel?.toJson(),
        "statusCode": statusCode,
        "valid": valid,
        "message": message,
        "token": token,
        "data": data,
      };
}
