part 'user_badge_count.g.dart';

@JsonSerializable()
class UserBadgeCountModel {
  final int bronze;
  final int silver;
  final int gold;

  UserBadgeCountModel({
    required this.bronze,
    required this.silver,
    required this.gold,
  });

  factory UserBadegCountModel.fromJson(Map<String, dynamic> json) =>
      _$UserBadegCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserBadegCountModelToJson(this);
}
