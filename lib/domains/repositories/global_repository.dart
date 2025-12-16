import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_repository.g.dart';


class IdentityVerificationRepository {
  Future<bool> checkVerificationStatus() async {
    // APIから本人確認状態を取得する処理を実装
    // 仮実装
    return true;
  }
}

@riverpod
IdentityVerificationRepository identityVerificationRepository(IdentityVerificationRepositoryRef ref) {
  return IdentityVerificationRepository();
}