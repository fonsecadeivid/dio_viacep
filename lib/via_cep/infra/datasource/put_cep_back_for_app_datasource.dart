import '../../domain/entities/entities.dart';

abstract class IPutCepBackForAppDatasource {
  Future<bool> putCepBackForApp({required PutCepBackForAppEntity cepEntity});
}
