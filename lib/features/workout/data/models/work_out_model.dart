import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity.dart';

part 'work_out_model.freezed.dart';
part 'work_out_model.g.dart';

@freezed
class WorkOutModel with _$WorkOutModel {
  const factory WorkOutModel({
    String? id,
    String? name,
    String? bodyPart,
    String? difficulty,
    String? equipment,
    String? instructions,
    String? videoUrl,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) = _WorkOutModel;

  factory WorkOutModel.fromJson(Map<String, dynamic> json) => _$WorkOutModelFromJson(json);
}


extension WorkOutModelConversion on WorkOutEntity {
  WorkOutModel toModel() => WorkOutModel(
        id: id,
        name: name,
        bodyPart: bodyPart,
        difficulty: difficulty,
        equipment: equipment,
        instructions: instructions,
        videoUrl: videoUrl,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );
}

extension WorkOutEntityConversion on WorkOutModel {
  WorkOutEntity toEntity() => WorkOutEntity(
        id: id,
        name: name,
        bodyPart: bodyPart,
        difficulty: difficulty,
        equipment: equipment,
        instructions: instructions,
        videoUrl: videoUrl,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );
}
