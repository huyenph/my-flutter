import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  final String id;
  final String title;
  @JsonKey(includeIfNull: true)
  final String? locationNames;
  @JsonKey(defaultValue: false)
  final bool isFeatured;

  const Job({
    required this.id,
    required this.title,
    this.locationNames,
    this.isFeatured = false,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}
