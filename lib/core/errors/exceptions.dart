class ViaCepException implements Exception {}

class ServerBackForAppException implements Exception {
  final String message;

  ServerBackForAppException({required this.message});

  @override
  String toString() => 'ServerBackForAppException: $message';
}
