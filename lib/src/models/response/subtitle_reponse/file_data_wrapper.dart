import 'package:json_annotation/json_annotation.dart';
import 'file_data.dart';

part 'file_data_wrapper.g.dart';

@JsonSerializable()
class FileDataWrapper {
  final FileData data;

  FileDataWrapper({required this.data});

  factory FileDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$FileDataWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$FileDataWrapperToJson(this);
}
