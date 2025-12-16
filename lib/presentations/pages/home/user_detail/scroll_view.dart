import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/presentations/components/floating_tab_scroll_view.dart';
import 'package:econa_mobile_app/presentations/layout.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/profile_widget.dart';
import 'package:flutter/material.dart';

/// ユーザー詳細情報のスクロール可能なビュー
class UserDetailScrollView extends StatelessWidget {
  const UserDetailScrollView({
    required this.userDetail,
    required this.pageType,
    super.key,
  });

  final UserDetail userDetail;
  final DetailPageType pageType;

  @override
  Widget build(BuildContext context) {
    // らしさマッチ以外画面からの遷移時はフローティングタブを無効にする
    final enableFloatingTab = pageType == DetailPageType.rashisaMatch;

    final config = FloatingTabScrollConfig(
      tabPosition: 642,
      tabLabels: const ['Laviからのおすすめ', 'プロフィール'],
      pageKey: 'user_detail',
      enableFloatingTab: enableFloatingTab,
    );

    return FloatingTabScrollView(
      config: config,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: EconaPagePadding.vertical,
        ),
        child: Center(
          child: UserProfile(
            userDetail: userDetail,
            pageType: pageType,
          ),
        ),
      ),
    );
  }
}
