import 'package:dio/dio.dart';

abstract class Failure {

  final String errorMessage;

  const Failure(this.errorMessage);
}


class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError)
  {
    switch(dioError.type){

      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout');
        ;
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout');


      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('request canceled');

      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException'))
          {
            return ServerFailure('No Internet Connection');
          }
        return ServerFailure('UNEXPECTED ERROR');
      default:
        return ServerFailure('EEERRROOORRR');
    }
  }


  factory ServerFailure.fromResponse(int statusCode , dynamic response) {
    if(statusCode == 400 || statusCode == 401 || statusCode == 403 )
      {
        return ServerFailure(response['error']['message']);
      }else if (statusCode == 404)
        {
          return ServerFailure('server not found');
        }else if (statusCode == 500)
          {
            return ServerFailure('internal server ERROR');
          }else
            {
              return ServerFailure('ERROR ERROR ERROR ERROR');
            }
  }
}