import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/language_code.pbenum.dart';

// 共通で使用する言語リスト（未指定は除外）
final List<LanguageCode> languages = LanguageCode.values
    .where((e) => e != LanguageCode.LANGUAGE_CODE_UNSPECIFIED)
    .toList();

// 表示用ラベル
String languageName(LanguageCode code) {
  switch (code) {
    case LanguageCode.LANGUAGE_CODE_JA:
      return '日本語';
    case LanguageCode.LANGUAGE_CODE_EN:
      return '英語';
    case LanguageCode.LANGUAGE_CODE_ZH:
      return '中国語';
    case LanguageCode.LANGUAGE_CODE_KO:
      return '韓国語';
    case LanguageCode.LANGUAGE_CODE_FR:
      return 'フランス語';
    case LanguageCode.LANGUAGE_CODE_DE:
      return 'ドイツ語';
    case LanguageCode.LANGUAGE_CODE_ES:
      return 'スペイン語';
    case LanguageCode.LANGUAGE_CODE_IT:
      return 'イタリア語';
    case LanguageCode.LANGUAGE_CODE_RU:
      return 'ロシア語';
    case LanguageCode.LANGUAGE_CODE_PT:
      return 'ポルトガル語';
    case LanguageCode.LANGUAGE_CODE_TH:
      return 'タイ語';
    case LanguageCode.LANGUAGE_CODE_VI:
      return 'ベトナム語';
    case LanguageCode.LANGUAGE_CODE_ID:
      return 'インドネシア語';
    case LanguageCode.LANGUAGE_CODE_AR:
      return 'アラビア語';
    case LanguageCode.LANGUAGE_CODE_HI:
      return 'ヒンディー語';
    case LanguageCode.LANGUAGE_CODE_TR:
      return 'トルコ語';
    case LanguageCode.LANGUAGE_CODE_PL:
      return 'ポーランド語';
    case LanguageCode.LANGUAGE_CODE_UK:
      return 'ウクライナ語';
    case LanguageCode.LANGUAGE_CODE_RO:
      return 'ルーマニア語';
    case LanguageCode.LANGUAGE_CODE_BN:
      return 'ベンガル語';
    case LanguageCode.LANGUAGE_CODE_TA:
      return 'タミル語';
    case LanguageCode.LANGUAGE_CODE_PA:
      return 'パンジャーブ語';
    case LanguageCode.LANGUAGE_CODE_JW:
      return 'ジャワ語';
    case LanguageCode.LANGUAGE_CODE_TL:
      return 'タガログ語';
    case LanguageCode.LANGUAGE_CODE_UNSPECIFIED:
      return '-';
  }
  return '-';
}


