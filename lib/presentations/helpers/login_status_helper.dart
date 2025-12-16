import 'package:econa_mobile_app/presentations/color.dart';
import 'package:flutter/material.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_activity_tag.pbenum.dart'
    show UserActivityTag;

// Tag → 表示テキスト（switch文）
String loginStatusTextFromTag(UserActivityTag tag) {
  switch (tag) {
    case UserActivityTag.USER_ACTIVITY_TAG_ONLINE:
      return 'オンライン';
    case UserActivityTag.USER_ACTIVITY_TAG_24_HOURS:
      return '24時間以内';
    case UserActivityTag.USER_ACTIVITY_TAG_3_DAYS:
      return '3日以内';
    case UserActivityTag.USER_ACTIVITY_TAG_1_WEEK:
      return '1週間以内';
    case UserActivityTag.USER_ACTIVITY_TAG_1_MONTH:
      return '1か月以内';
    case UserActivityTag.USER_ACTIVITY_TAG_OVER_1_MONTHS:
      return '1か月以上';
    case UserActivityTag.USER_ACTIVITY_TAG_UNSPECIFIED:
      return '1か月以上';
  }
  throw StateError('Unsupported UserActivityTag: $tag');
}

// Tag → 色（switch文）
Color loginStatusColorFromTag(UserActivityTag tag) {
  switch (tag) {
    case UserActivityTag.USER_ACTIVITY_TAG_ONLINE:
      return EconaColor.loginStatusOnline;
    case UserActivityTag.USER_ACTIVITY_TAG_24_HOURS:
      return EconaColor.loginStatusWithin24h;
    case UserActivityTag.USER_ACTIVITY_TAG_3_DAYS:
      return EconaColor.loginStatusWithin3d;
    case UserActivityTag.USER_ACTIVITY_TAG_1_WEEK:
      return EconaColor.loginStatusWithin1w;
    case UserActivityTag.USER_ACTIVITY_TAG_1_MONTH:
      return EconaColor.loginStatusWithin1m;
    case UserActivityTag.USER_ACTIVITY_TAG_OVER_1_MONTHS:
      return EconaColor.loginStatusOver1m;
    case UserActivityTag.USER_ACTIVITY_TAG_UNSPECIFIED:
      return EconaColor.loginStatusOver1m;
  }
  throw StateError('Unsupported UserActivityTag: $tag');
}


