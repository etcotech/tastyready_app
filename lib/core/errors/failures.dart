import 'package:equatable/equatable.dart';

 class Failure extends Equatable {
  final String? message;
  

  const Failure({ this.message});
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  @override
  final String? message;
  const ServerFailure({ this.message}):super(message: message??'server');

}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {
  @override
  final String? message;
  const NetworkFailure({ this.message}):super(message: message??'network');

}

class ExceptionFailure extends Failure {
  @override
  final String? message;
  const ExceptionFailure({ this.message}):super(message: message??'unknown');
}

class CredentialFailure extends Failure {
    @override
  final String? message;
  const CredentialFailure({ this.message}):super(message: message??'credential');
}
class TimeoutFailure extends Failure {
   @override
  final String? message;
  const TimeoutFailure({ this.message}):super(message: message??'timeout');
}

class AuthenticationFailure extends Failure {
  @override
  final String? message;
  const AuthenticationFailure({ this.message}):super(message: message??'token');
}
