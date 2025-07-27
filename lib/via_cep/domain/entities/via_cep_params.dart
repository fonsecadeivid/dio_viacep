import 'package:equatable/equatable.dart';

class ViaCepParams extends Equatable {
  final String cep;

  const ViaCepParams({required this.cep});

  @override
  List<Object?> get props => [cep];
}
