// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class PostCepBackForAppEntity extends Equatable {
  String? objectId;
  String? createdAt;

  PostCepBackForAppEntity({required this.objectId, required this.createdAt});

  @override
  List<Object?> get props => [objectId, createdAt];
}
