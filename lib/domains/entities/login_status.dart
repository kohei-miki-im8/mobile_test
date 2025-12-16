import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_activity_tag.pbenum.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:flutter/material.dart';

/// ログイン状態を表すenum
enum LoginStatus {
  online(
    text: 'オンライン',
    dotColor: EconaColor.feedbackGreenNormal,
    userActivityTag: UserActivityTag.USER_ACTIVITY_TAG_ONLINE,
  ),
  within24Hours(
    text: '24時間以内',
    dotColor: EconaColor.feedbackOrangeNormal,
    userActivityTag: UserActivityTag.USER_ACTIVITY_TAG_24_HOURS,
  ),
  within3Days(
    text: '3日以内',
    dotColor: EconaColor.colorsYellow,
    userActivityTag: UserActivityTag.USER_ACTIVITY_TAG_3_DAYS,
  ),
  within1Week(
    text: '1週間以内',
    dotColor: EconaColor.grayGray,
    userActivityTag: UserActivityTag.USER_ACTIVITY_TAG_1_WEEK,
  ),
  within1Month(
    text: '1か月以内',
    dotColor: EconaColor.grayGray,
    userActivityTag: UserActivityTag.USER_ACTIVITY_TAG_1_MONTH,
  ),
  over1Months(
    text: '1か月以上',
    dotColor: EconaColor.grayGray,
    userActivityTag: UserActivityTag.USER_ACTIVITY_TAG_OVER_1_MONTHS,
  ),
  unspecified(
    text: 'オフライン',
    dotColor: EconaColor.grayNormal,
    userActivityTag: UserActivityTag.USER_ACTIVITY_TAG_UNSPECIFIED,
  );

  const LoginStatus({
    required this.text,
    required this.dotColor,
    required this.userActivityTag,
  });

  final String text;
  final Color dotColor;
  final UserActivityTag userActivityTag;

  /// UserActivityTagからLoginStatusを取得
  static LoginStatus fromUserActivityTag(UserActivityTag tag) {
    return switch (tag) {
      UserActivityTag.USER_ACTIVITY_TAG_ONLINE => LoginStatus.online,
      UserActivityTag.USER_ACTIVITY_TAG_24_HOURS => LoginStatus.within24Hours,
      UserActivityTag.USER_ACTIVITY_TAG_3_DAYS => LoginStatus.within3Days,
      UserActivityTag.USER_ACTIVITY_TAG_1_WEEK => LoginStatus.within1Week,
      UserActivityTag.USER_ACTIVITY_TAG_1_MONTH => LoginStatus.within1Month,
      UserActivityTag.USER_ACTIVITY_TAG_OVER_1_MONTHS =>
        LoginStatus.over1Months,
      UserActivityTag.USER_ACTIVITY_TAG_UNSPECIFIED => LoginStatus.unspecified,
      _ => () {
          return LoginStatus.unspecified;
        }(),
    };
  }
}
