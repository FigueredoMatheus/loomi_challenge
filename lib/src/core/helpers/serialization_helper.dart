import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';

class SerializationHelper {
  static String commentStatusToJson(CommentStatus status) => status.name;

  static CommentStatus commentStatusFromJson(String status) =>
      CommentStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => CommentStatus.Failure,
      );

  static Map<String, dynamic> userToJson(UserEntity user) => user.toJson();

  static UserEntity userFromJson(Map<String, dynamic> json) =>
      UserEntity.fromJson(json);
}
