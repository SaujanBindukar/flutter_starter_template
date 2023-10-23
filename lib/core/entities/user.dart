import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    required String name,
    @Default('') String address,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
