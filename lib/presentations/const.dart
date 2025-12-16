import 'package:econa_mobile_app/presentations/color.dart';
import 'package:flutter/material.dart';

class EconaNavigationBarText {
  static const homeLabel = 'ホーム';
  static const likeLabel = 'いいね';
  static const chatLabel = 'やりとり';
  static const rashisaMatchLabel = 'らしさマッチ';
  static const karuteLabel = 'カルテ';
  static const myPageLabel = 'マイページ';
}

class EconaAppBarText {
  static const chatListTitle = 'やりとり';
  static const homeTitle = 'ホーム';
  static const karuteTitle = 'カルテ';
  static const loveAdviceTitle = '恋愛アドバイス';
  static const rashisaMatchTitle = 'らしさマッチ';
  static const questionTitle = 'しつもん';
  static const lavigationLabel = 'Lavigation';
  static const likeLabel = 'いいね';
  static const simulationTitle = 'やりとりシミュレーション';
}

// プロフィールのリストアイテム
class ListItem {
  const ListItem(this.name, {this.id});

  final String name;
  final int? id; // オプショナルにして、必要な場合のみ持つ

  // インデックスベースのID（0から始まる）
  int getIndex(List<ListItem> items) {
    return items.indexOf(this);
  }
}

// Likeタグのアイコン
class LikeTagIcons {
  const LikeTagIcons(this.id, this.icon);

  final int id;
  final Icon icon;
}

class TagCategoryIcon {
  static const icon = [
    LikeTagIcons(1, Icon(Icons.school, color: EconaColor.tagIcon)),
    LikeTagIcons(2, Icon(Icons.flight_takeoff, color: EconaColor.tagIcon)),
    LikeTagIcons(3, Icon(Icons.sports_esports, color: EconaColor.tagIcon)),
    LikeTagIcons(4, Icon(Icons.movie, color: EconaColor.tagIcon)),
    LikeTagIcons(5, Icon(Icons.park, color: EconaColor.tagIcon)),
    LikeTagIcons(6, Icon(Icons.pets, color: EconaColor.tagIcon)),
    LikeTagIcons(7, Icon(Icons.catching_pokemon, color: EconaColor.tagIcon)),
    LikeTagIcons(8, Icon(Icons.smart_display, color: EconaColor.tagIcon)),
    LikeTagIcons(9, Icon(Icons.checkroom, color: EconaColor.tagIcon)),
    LikeTagIcons(10, Icon(Icons.color_lens, color: EconaColor.tagIcon)),
    LikeTagIcons(11, Icon(Icons.attractions, color: EconaColor.tagIcon)),
    LikeTagIcons(12, Icon(Icons.directions_car, color: EconaColor.tagIcon)),
    LikeTagIcons(13, Icon(Icons.theater_comedy, color: EconaColor.tagIcon)),
    LikeTagIcons(14, Icon(Icons.menu_book, color: EconaColor.tagIcon)),
    LikeTagIcons(15, Icon(Icons.local_bar, color: EconaColor.tagIcon)),
    LikeTagIcons(16, Icon(Icons.devices, color: EconaColor.tagIcon)),
    LikeTagIcons(17, Icon(Icons.ramen_dining, color: EconaColor.tagIcon)),
    LikeTagIcons(18, Icon(Icons.sports_tennis, color: EconaColor.tagIcon)),
    LikeTagIcons(19, Icon(Icons.chair, color: EconaColor.tagIcon)),
    LikeTagIcons(20, Icon(Icons.headphones, color: EconaColor.tagIcon)),
    LikeTagIcons(21, Icon(Icons.handyman, color: EconaColor.tagIcon)),
    LikeTagIcons(22, Icon(Icons.verified, color: EconaColor.tagIcon)),
  ];
}

/// WebViewで表示するURL群
class EconaWebUrl {
  static const privacy = 'https://lavigation.com/privacy';
  static const law = 'https://lavigation.com/law';
  static const contact = 'https://lavigation.com/contact';
  static const terms = 'https://lavigation.com/terms';
  static const company = 'https://ai-mate.co.jp/company/#sec03';
  static const unsubscribedAndroid = 'https://support.google.com/googleplay/answer/7018481';
  static const unsubscribedIos = 'https://support.apple.com/ja-jp/118428';
}

/// プロフィール写真の参考画像
class EconaSamplePhoto {
  static const Map<String, String> goodPhotoMale = {
    'assets/images/photos/sample_male_good_1.webp': '正面',
    'assets/images/photos/sample_male_good_2.webp': '全身',
    'assets/images/photos/sample_male_good_3.webp': '趣味',
  };

  static const Map<String, String> goodPhotoFemale = {
    'assets/images/photos/sample_female_good_1.webp': '正面',
    'assets/images/photos/sample_female_good_2.webp': '全身',
    'assets/images/photos/sample_female_good_3.webp': '趣味',
  };

  static const Map<String, String> badPhotoMale = {
    'assets/images/photos/sample_male_bad_1.webp': '顔がわからない',
    'assets/images/photos/sample_male_bad_2.webp': '近すぎる',
    'assets/images/photos/sample_male_bad_3.webp': '粗い',
  };

  static const Map<String, String> badPhotoFemale = {
    'assets/images/photos/sample_female_bad_1.webp': '顔がわからない',
    'assets/images/photos/sample_female_bad_2.webp': '近すぎる',
    'assets/images/photos/sample_female_bad_3.webp': '粗い',
  };
}
