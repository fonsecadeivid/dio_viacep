import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  const Failures({this.message});
  final String? message;
}

class ServerFailure extends Failures {
  const ServerFailure({super.message});

  @override
  List<Object?> get props => [message];
}
