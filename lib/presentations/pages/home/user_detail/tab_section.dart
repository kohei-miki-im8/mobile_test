import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_tab.dart';
import 'package:econa_mobile_app/presentations/components/econa_tag.dart';
import 'package:econa_mobile_app/presentations/components/headline_text.dart';
import 'package:econa_mobile_app/presentations/components/profile_info.dart';
import 'package:econa_mobile_app/presentations/helpers/label_localizer.dart';
import 'package:econa_mobile_app/presentations/pages/chat/chat_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/my_avatar_image_provider.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タブセクション（Laviからのおすすめ、プロフィール）
/// ホーム画面からの遷移時はタブは非表示で内容はプロフィール固定
class TabSection extends HookConsumerWidget {
  const TabSection({
    required this.userDetail,
    required this.pageType,
    super.key,
  });

  final UserDetail userDetail;
  final DetailPageType pageType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = userDetail.profileDetail;

    final myUserId = ref.read(authRepositoryProvider).userId!;
    final commonTagsAsync = ref.read(
      commonTagsProvider((myUserId, userDetail.profile.userId)),
    );
    final int commonTagsCount = commonTagsAsync.maybeWhen(
      data: (tags) => tags.length,
      orElse: () => 0,
    );

    Widget toAvatarImage;
    if(userDetail.profile.bestImageUrls == null) {
      toAvatarImage = Image.asset(
        userDetail.profile.isMale
            ? 'assets/images/illusts/no_image_male_small.webp'
            : 'assets/images/illusts/no_image_female_small.webp',
        fit: BoxFit.cover,
      );
    } else {
      toAvatarImage =  Image.network(
        userDetail.profile.bestImageUrls!.avatarIconWebpUrl ?? userDetail.profile.bestImageUrls!.originUrl!,
        fit: BoxFit.cover,
      );
    }

    final myAvatarImage = ref.read(myAvatarImageProvider);

    // TODO: API定義ができ次第APIから取得した文言を表示
    final List<Widget> tabContents = [
      // Laviからのおすすめタブの内容
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userDetail.matchingReason?.reasonTitle ?? '',
            style: EconaTextStyle.labelSmall140(
              color: EconaColor.grayNormal,
            ),
          ),
          const SizedBox(height: 17.5),
          Text(
            userDetail.matchingReason?.reasonContent ?? '',
            style: EconaTextStyle.regularMedium2200(
              color: EconaColor.grayDarkActive,
            ),
          ),
        ],
      ),
      // プロフィールタブの内容（基本情報、容姿など）
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineLarge(text: '基本情報'),
          HeadlineDefault(
            label: 'ニックネーム',
            value: (profile?.nickname.isEmpty ?? true) ? '未設定' : profile!.nickname,
          ),
          HeadlineDefault(
            label: '年齢',
            value: (profile?.ageText.isEmpty ?? true) ? '未設定' : profile!.ageText,
          ),
          HeadlineDefault(
            label: '居住地',
            value: (profile?.residence.isEmpty ?? true) ? '未設定' : profile!.residence,
          ),
          HeadlineDefault(
            label: '血液型',
            value: profile == null || profile.bloodType.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.bloodType),
          ),
          HeadlineDefault(
            label: '出身地',
            value: (profile?.birthplace.isEmpty ?? true) ? '未設定' : profile!.birthplace,
          ),
          const SizedBox(height: 20),
          const HeadlineLarge(text: '容姿'),
          HeadlineDefault(
            label: '身長',
            value: (profile?.heightText.isEmpty ?? true) ? '未設定' : profile!.heightText,
          ),
          HeadlineDefault(
            label: '体型',
            value: profile == null || profile.bodyType.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.bodyType),
          ),
          const SizedBox(height: 20),
          const HeadlineLarge(text: '性格'),
          HeadlineDefault(
            label: '社交性',
            value: profile == null || profile.sociability.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.sociability),
          ),
          HeadlineDefault(
            label: 'よく言われる性格タイプ',
            value: profile == null || profile.commonlySaidPersonality.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.commonlySaidPersonality),
          ),
          HeadlineDefault(
            label: '16タイプ診断',
            value: profile == null || profile.sixteenPersonality.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.sixteenPersonality),
          ),
          const SizedBox(height: 20),
          const HeadlineLarge(text: '仕事・学歴'),
          HeadlineDefault(
            label: '職種',
            value: profile == null || profile.occupation.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.occupation),
          ),
          HeadlineDefault(
            label: '勤務地',
            value: (profile?.workplace.isEmpty ?? true) ? '未設定' : profile!.workplace,
          ),
          HeadlineDefault(
            label: '年収',
            value: profile == null || profile.salaryRange.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.salaryRange),
          ),
          HeadlineDefault(
            label: '学歴',
            value: profile == null || profile.educationalBackground.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.educationalBackground),
          ),
          const SizedBox(height: 20),
          const HeadlineLarge(text: '生活・その他'),
          HeadlineDefault(
            label: '兄弟姉妹',
            value: profile == null || profile.sibling.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.sibling),
          ),
          HeadlineDefault(
            label: '同居人',
            value: profile == null || profile.roommate.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.roommate),
          ),
          HeadlineDefault(
            label: '結婚歴',
            value: profile == null || profile.maritalHistory.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.maritalHistory),
          ),
          HeadlineDefault(
            label: '子供の有無',
            value: profile == null || profile.childSituation.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.childSituation),
          ),
          HeadlineDefault(
            label: '休日',
            value: profile == null || profile.holidayType.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.holidayType),
          ),
          HeadlineDefault(
            label: '話せる言語',
            value: (profile?.languages.isEmpty ?? true) ? '未設定' : profile!.languages,
          ),
          HeadlineDefault(
            label: 'お酒',
            value: profile == null || profile.drinkingAlcohol.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.drinkingAlcohol),
          ),
          HeadlineDefault(
            label: 'タバコ',
            value: profile == null || profile.smoking.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.smoking),
          ),
          const SizedBox(height: 20),
          const HeadlineLarge(text: '将来'),
          HeadlineDefault(
            label: '結婚への意思',
            value: profile == null || profile.marriageAspiration.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.marriageAspiration),
          ),
          HeadlineDefault(
            label: '子供がほしいか',
            value: profile == null || profile.childDesire.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.childDesire),
          ),
          HeadlineDefault(
            label: '家事育児',
            value: profile == null || profile.houseWork.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.houseWork),
          ),
          const SizedBox(height: 20),
          const HeadlineLarge(text: '初回デート'),
          HeadlineDefault(
            label: '出会うまでの希望',
            value: profile == null || profile.datingPreference.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.datingPreference),
          ),
          HeadlineDefault(
            label: '初回のデート費用',
            value: profile == null || profile.firstDateCostPreference.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.firstDateCostPreference),
          ),
          HeadlineDefault(
            label: '初回デートするなら',
            value: profile == null || profile.firstDateLocationPreference.value == 'common.hyphen'
                ? '未設定'
                : localizeLabel(profile.firstDateLocationPreference),
          ),
        ],
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 56,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ユーザーの基本プロフィール情報（名前、年齢など）
          ProfileInfo(
            profile: userDetail.profile,
            textColor: EconaColor.grayDarkActive,
            padding: EdgeInsets.zero,
            verifiedBadgeBackgroundColor: EconaColor.purpleLight,
            isVisibleLoginStatus: pageType != DetailPageType.chat,
          ),
          SizedBox(
            height: switch (pageType) {
              DetailPageType.home ||
              DetailPageType.profile ||
              DetailPageType.like ||
              DetailPageType.chat => 27,
              DetailPageType.rashisaMatch => 24,
            },
          ),
          switch (pageType) {
            // ホーム画面時は共通点と自己紹介文を表示
            DetailPageType.home || DetailPageType.profile ||
            DetailPageType.like || DetailPageType.chat =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadlineLarge(text: 'あなたとの共通点'),
                  const SizedBox(height: 11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipOval(
                          child: toAvatarImage,
                        ),
                      ),
                      const SizedBox(width: 17),
                      const VerticalBar(),
                      const SizedBox(width: 17),
                      Container(
                        height: 72,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipOval(
                          child: myAvatarImage.when(
                            data: (image) => image,
                            loading: () => const SizedBox(),
                            error: (_, __) => const SizedBox(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if(commonTagsCount > 0)...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$commonTagsCount',
                          style: EconaTextStyle.headlineLargeTitle(
                            color: EconaColor.grayNormal,
                          ),
                        ),
                        Text(
                          '個',
                          style: EconaTextStyle.labelMedium1140(
                            color: EconaColor.grayNormal,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 20),
                  CommonTags(commonTags: commonTagsAsync),
                  const SizedBox(height: 51),
                  const HeadlineLarge(text: '自己紹介文'),
                  const SizedBox(
                    height: 31,
                  ),
                  Text(
                    profile?.introductory ?? '未設定',
                    style: EconaTextStyle.regularSmall140(
                      color: EconaColor.grayDarkActive,
                    ),
                  ),
                ],
              ),
            // らしさマッチ画面時はタブを表示
            DetailPageType.rashisaMatch => Center(
                child: AnimatedOpacity(
                  // スクロール時にフェードアウト
                  // (固定タブが消えてフローティングに切り替わる)
                  opacity: ref.watch(isOverlayVisibleProvider('user_detail'))
                      ? 0.0
                      : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: const EconaTabWithProvider(
                    labels: ['Laviからのおすすめ', 'プロフィール'],
                    pageKey: 'user_detail',
                  ),
                ),
              ),
          },
          const SizedBox(height: 33.5),
          switch (pageType) {
            // ホーム画面時はプロフィール情報を固定表示
            DetailPageType.home || DetailPageType.profile ||
            DetailPageType.like || DetailPageType.chat =>
              tabContents[1],
            // らしさマッチ画面時は選択されたタブの内容を表示
            DetailPageType.rashisaMatch =>
              tabContents[ref.watch(tabIndexProvider('user_detail'))],
          },
        ],
      ),
    );
  }
}

/// 共通点表示用の垂直区切り線ウィジェット
/// 共通点の視覚的表現で使用される細い縦線
class VerticalBar extends StatelessWidget {
  const VerticalBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0,
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFDADDF0),
          width: 1,
        ),
      ),
    );
  }
}

class CommonTags extends StatelessWidget {
  const CommonTags({
    required this.commonTags,
    super.key,
  });
  final AsyncValue<List<String>> commonTags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        Builder(builder: (context) {
          return commonTags.when(
            data: (List<String> tags) {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final String tag in tags) ...[
                    EconaTag(tag: tag),
                  ],
                ],
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          );
        }),
      ],
    );
  }
}
