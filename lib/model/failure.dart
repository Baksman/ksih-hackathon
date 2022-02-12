// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../../constants.dart';
// import 'exceptions.dart';

abstract class Failure {}

class NullFailure implements Failure {
  const NullFailure._();

  factory NullFailure() => instance;
  static const instance = NullFailure._();
}

class ServerFailure implements Failure {
  final String error;
  ServerFailure({required this.error});
  @override
  String toString() {
    return error;
  }
}

class InputFailure implements Failure {
  final String errorMessage;
  InputFailure({required this.errorMessage});
  @override
  String toString() {
    return errorMessage;
  }
}

class NotFoundFailure implements Failure {
  final String errorMessage;
  NotFoundFailure({required this.errorMessage});
  @override
  String toString() {
    return errorMessage;
  }
}

class BadAuthFailure implements Failure {
  final String errorMessage;
  BadAuthFailure({required this.errorMessage});
  @override
  String toString() {
    return errorMessage;
  }
}

class NetworkFailure implements Failure {
  final String message;

  NetworkFailure({required this.message});
  @override
  String toString() {
    return message;
  }
}

class TimeoutFailure implements Failure {
  final String message;

  TimeoutFailure({required this.message});
  @override
  String toString() {
    return message;
  }
}

class UnknownFailure implements Failure {
  final String message;
  UnknownFailure({required this.message});
  @override
  String toString() {
    return message;
  }
}

// Failure convertException(e) {
//   if (e is InputException || e is ServerException || e is UnauthorisedException)
//     return e.toFailure();
//   else if (e is NetworkException || e is SocketException)
//     return NetworkFailure(message: NETWORK_ERROR_MESSAGE);
//   else if (e is TimeoutException)
//     return TimeoutFailure();
//   else
//     return UnknownFailure(message: UNKNOWN_ERROR);
// }

class ImagePickerFailure implements Failure {
  final String errorMessage;

  ImagePickerFailure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class NoImageFailure implements Failure {
  final String errorMessage;

  NoImageFailure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class ImagePermanentlyDeniedFailure implements Failure {
  final String errorMessage;

  ImagePermanentlyDeniedFailure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}



