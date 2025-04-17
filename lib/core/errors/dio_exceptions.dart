class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException(this.message, this.statusCode);

  @override
  String toString() => 'ApiException: $message (Status Code: $statusCode)';
}

class BadRequestException extends ApiException {
  BadRequestException(String message) : super(message, 400);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(String message) : super(message, 401);
}

class ForbiddenException extends ApiException {
  ForbiddenException(String message) : super(message, 403);
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(message, 404);
}

class ValidationException extends ApiException {
  ValidationException(String message) : super(message, 422);
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(String message) : super(message, 500);
}

class InternetException extends ApiException {
  InternetException(String message) : super('internet', 1000);
}

class TimeoutException extends ApiException {
  TimeoutException(String message) : super('timeout', 1001);
}