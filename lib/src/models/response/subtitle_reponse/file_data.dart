import 'package:json_annotation/json_annotation.dart';
import 'file_attributes.dart';

part 'file_data.g.dart';

@JsonSerializable()
class FileData {
  final int id;
  final FileAttributes attributes;

  FileData({required this.id, required this.attributes});

  factory FileData.fromJson(Map<String, dynamic> json) =>
      _$FileDataFromJson(json);
  Map<String, dynamic> toJson() => _$FileDataToJson(this);
}
