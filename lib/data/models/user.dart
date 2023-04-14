import 'package:clean_architecture/data/models/user_badge_count.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  @JsonKey(name: 'badge_counts')
  final UserBadgeCountModel badgeCounts;

  @JsonKey(name: 'account_id')
  final int accountId;

  @JsonKey(name: 'is_employee')
  final bool isEmployee;

  @JsonKey(name: 'last_modified_date')
  final int lastModifiedDate;

  @JsonKey(name: 'last_access_date')
  final int lastAccessDate;

  @JsonKey(name: 'reputation_change_year')
  final int reputationChangeYear;

  @JsonKey(name: 'reputation_change_quarter')
  final int reputationChangeQuarter;

  @JsonKey(name: 'reputation_change_month')
  final int reputationChangeMonth;

  @JsonKey(name: 'reputation_change_week')
  final int reputationChangeWeek;

  @JsonKey(name: 'reputation_change_week')
  final int reputationChangeDay;

  final int reputation;

  @JsonKey(name: 'creation_date')
  final int creationDate;

  @JsonKey(name: 'user_type')
  final String userType;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'accept_rate')
  final int acceptRate;

  final String location;

  @JsonKey(name: 'website_url')
  final String websiteUrl;

  final String link;

  @JsonKey(name: 'profile_image')
  final String profileImage;

  @JsonKey(name: 'display_name')
  final String displayName;

  const UserModel({
    required this.badgeCounts,
    required this.accountId,
    required this.isEmployee,
    required this.lastModifiedDate,
    required this.lastAccessDate,
    required this.reputationChangeYear,
    required this.reputationChangeQuarter,
    required this.reputationChangeMonth,
    required this.reputationChangeWeek,
    required this.reputationChangeDay,
    required this.reputation,
    required this.creationDate,
    required this.userType,
    required this.userId,
    required this.acceptRate,
    required this.location,
    required this.websiteUrl,
    required this.link,
    required this.profileImage,
    required this.displayName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    final UserBadgeCountModel? badgeCounts,
    final int? accountId,
    final bool? isEmployee,
    final int? lastModifiedDate,
    final int? lastAccessDate,
    final int? reputationChangeYear,
    final int? reputationChangeQuarter,
    final int? reputationChangeMonth,
    final int? reputationChangeWeek,
    final int? reputationChangeDay,
    final int? reputation,
    final int? creationDate,
    final String? userType,
    final int? userId,
    final int? acceptRate,
    final String? location,
    final String? websiteUrl,
    final String? link,
    final String? profileImage,
    final String? displayName,
  }) {
    return UserModel(
      badgeCounts: badgeCounts ?? this.badgeCounts,
      accountId: accountId ?? this.accountId,
      isEmployee: isEmployee ?? this.isEmployee,
      lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
      lastAccessDate: lastAccessDate ?? this.lastAccessDate,
      reputationChangeYear: reputationChangeYear ?? this.reputationChangeYear,
      reputationChangeQuarter:
          reputationChangeQuarter ?? this.reputationChangeQuarter,
      reputationChangeMonth:
          reputationChangeMonth ?? this.reputationChangeMonth,
      reputationChangeWeek: reputationChangeWeek ?? this.reputationChangeWeek,
      reputationChangeDay: reputationChangeDay ?? this.reputationChangeDay,
      reputation: reputation ?? this.reputation,
      creationDate: creationDate ?? this.creationDate,
      userType: userType ?? this.userType,
      userId: userId ?? this.userId,
      acceptRate: acceptRate ?? this.acceptRate,
      location: location ?? this.location,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      link: link ?? this.link,
      profileImage: profileImage ?? this.profileImage,
      displayName: displayName ?? this.displayName,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        badgeCounts,
        accountId,
        isEmployee,
        lastModifiedDate,
        lastAccessDate,
        reputationChangeYear,
        reputationChangeQuarter,
        reputationChangeMonth,
        reputationChangeWeek,
        reputationChangeDay,
        reputation,
        creationDate,
        userType,
        userId,
        acceptRate,
        location,
        websiteUrl,
        link,
        profileImage,
        displayName,
      ];
}
