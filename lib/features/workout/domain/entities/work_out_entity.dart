import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_out_entity.freezed.dart';
part 'work_out_entity.g.dart';

@freezed
class WorkOutEntity with _$WorkOutEntity {
    const factory WorkOutEntity({
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
    }) = _WorkOutEntity;

    factory WorkOutEntity.fromJson(Map<String, dynamic> json) => _$WorkOutEntityFromJson(json);
}
