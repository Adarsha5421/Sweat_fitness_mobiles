// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOutModelImpl _$$WorkOutModelImplFromJson(Map<String, dynamic> json) =>
    _$WorkOutModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      bodyPart: json['bodyPart'] as String?,
      difficulty: json['difficulty'] as String?,
      equipment: json['equipment'] as String?,
      instructions: json['instructions'] as String?,
      videoUrl: json['videoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WorkOutModelImplToJson(_$WorkOutModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bodyPart': instance.bodyPart,
      'difficulty': instance.difficulty,
      'equipment': instance.equipment,
      'instructions': instance.instructions,
      'videoUrl': instance.videoUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
