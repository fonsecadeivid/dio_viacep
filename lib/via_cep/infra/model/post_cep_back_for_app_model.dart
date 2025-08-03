// ignore_for_file: must_be_immutable

import 'package:dio_viacep/via_cep/domain/entities/post_cep_back_for_app_entity.dart';

class PostCepBackForAppModel extends PostCepBackForAppEntity {
  PostCepBackForAppModel({required super.objectId, required super.createdAt});

  factory PostCepBackForAppModel.fromJson(Map<String, dynamic> json) {
    return PostCepBackForAppModel(
      objectId: json['objectId'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    return data;
  }
}
