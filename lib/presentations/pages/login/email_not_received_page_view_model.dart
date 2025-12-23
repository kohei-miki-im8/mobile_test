import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_link_auth_page_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_not_received_page_view_model.g.dart';

/// EmailNotReceived用のシンプルなViewModel
@riverpod
class EmailNotReceivedViewModel extends _$EmailNotReceivedViewModel {
  @override
  void build() {
    // 状態管理なし、メソッドのみ提供
  }

  /// 確認メールを再送信
  Future<void> resendConfirmationEmail() async {
    final emailLinkAuthState = ref.read(emailLinkAuthViewModelProvider);
    final savedEmail = emailLinkAuthState.valueOrNull;
    
    if (savedEmail == null) {
      throw Exception('保存されたメールアドレスが見つかりません');
    }

    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.sendSignInLinkToEmail(email: savedEmail);
  }
} 