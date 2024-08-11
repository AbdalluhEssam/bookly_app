import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ServerFailure("Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout in connection with API server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(error.response!.statusCode!, error.response!.data);
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate");
      case DioExceptionType.connectionError:
        return ServerFailure("No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected error occurred");
      default:
        return ServerFailure("Something went wrong");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, please try again");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server error, please try again");
    } else {
      return ServerFailure("Oops Something went wrong, please try again");
    }
  }
}
