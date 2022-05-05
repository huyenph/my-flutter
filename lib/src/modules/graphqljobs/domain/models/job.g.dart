// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['id'] as String,
      title: json['title'] as String,
      locationNames: json['locationNames'] as String?,
      isFeatured: json['isFeatured'] as bool? ?? false,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'locationNames': instance.locationNames,
      'isFeatured': instance.isFeatured,
    };
