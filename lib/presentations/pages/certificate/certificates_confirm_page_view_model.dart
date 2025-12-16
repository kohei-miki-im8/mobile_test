import 'dart:io';

import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/media_category.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/single_certificate_type.pbenum.dart';
import 'package:econa_mobile_app/infrastructures/repositories/media.dart';
import 'package:econa_mobile_app/infrastructures/services/media_upload_service.dart';
import 'package:econa_mobile_app/presentations/enums/certificate_type.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/certificates_confirm_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'certificates_confirm_page_view_model.g.dart';

/// 証明書確認ページのViewModel
@riverpod
class CertificateConfirmViewModel extends _$CertificateConfirmViewModel {
  @override
  Future<CertificateConfirmState> build() async {
    return const CertificateConfirmState();
  }

  /// 上段チェックボックスの状態を更新
  void updateUpperCheckBox(bool value) {
    final currentState = state.valueOrNull ?? const CertificateConfirmState();
    state = AsyncData(currentState.copyWith(upperCheckBoxValue: value));
  }

  /// 下段チェックボックスの状態を更新
  void updateLowerCheckBox(bool value) {
    final currentState = state.valueOrNull ?? const CertificateConfirmState();
    state = AsyncData(currentState.copyWith(lowerCheckBoxValue: value));
  }

  /// 証明書を提出
  Future<bool> submitCertificate(
      File certificateImage,
      CertificateType certificateType,
      ) async {
    final currentState = state.valueOrNull ?? const CertificateConfirmState();

    if (!currentState.isBothChecked) {
      state = AsyncData(currentState.copyWith(error: 'すべての項目をチェックしてください'));
      return false;
    }

    state = const AsyncLoading();

    try {
      // バリデーションチェック
      await _validateCertificate(certificateImage, certificateType);

      // API呼び出し処理
      await _uploadCertificate(certificateImage, certificateType);

      state = AsyncData(currentState.copyWith(error: null));
      return true;
    } catch (_) {
      state = AsyncData(currentState.copyWith(error: '証明書の提出に失敗しました'));
      return false;
    }
  }

  /// 証明書のバリデーション
  Future<void> _validateCertificate(File certificateImage, CertificateType certificateType) async {
    // 画像ファイルの存在チェック
    if (!await certificateImage.exists()) {
      throw Exception('画像ファイルが見つかりません');
    }

    // ファイルサイズチェック（10MB制限）
    final fileSize = await certificateImage.length();
    if (fileSize > 10 * 1024 * 1024) {
      throw Exception('ファイルサイズが10MBを超えています');
    }

    // ファイル形式チェック
    final extension = path.extension(certificateImage.path).toLowerCase();
    if (!['jpg', 'jpeg', 'png', 'webp'].contains(extension.replaceFirst('.', ''))) {
      throw Exception('サポートされていないファイル形式です');
    }
  }

  /// 証明書をアップロード（MediaUploadService使用）
  Future<void> _uploadCertificate(File certificateImage, CertificateType certificateType) async {
    try {
      final mediaRepo = ref.read(mediaRepositoryProvider);
      final uploadService = ref.read(mediaUploadServiceProvider);
      final fileName = path.basename(certificateImage.path);
      final metadata = <String, String>{
        'certificate_type': switch (certificateType) {
          CertificateType.single => SingleCertificateType.SINGLE_CERTIFICATE_TYPE_SINGLE_CERTIFICATE.name,
          CertificateType.familyRegister => SingleCertificateType.SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_COPY.name,
          CertificateType.familyRegisterExtract => SingleCertificateType.SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_EXCERPT.name,
        },
      };
      final stream = uploadService.buildStreamFromFile(
        filePath: certificateImage.path,
        fileName: fileName,
        category: MediaCategory.MEDIA_CATEGORY_SINGLE_CERTIFICATE_PHOTO,
        metadata: metadata,
      );
      await mediaRepo.chunkedMediaUpload(stream);
    } catch (e) {
      throw Exception('証明書のアップロードに失敗しました: ${e.toString()}');
    }
  }
}

/// 証明書タイプ別の確認テキスト設定管理
@riverpod
class CertificateConfirmTextViewModel extends _$CertificateConfirmTextViewModel {
  @override
  Map<CertificateType, CertificateConfirmTexts> build() {
    return {
      CertificateType.single: const CertificateConfirmTexts(
        text1: '撮影した画像に光源が写り込んだり、白飛びしたりしていない',
        text2: '一部が見切れたり、ぼやけておらず、文字を正確に読み取ることができる',
        guideText: '',
      ),
      CertificateType.familyRegister: const CertificateConfirmTexts(
        text1: '「本籍地」「従前戸籍情報」を黒く塗りつぶすか、紙や付箋、テープなどで隠した',
        text2: '戸籍上の【姓】（苗字）、ご本人に関する【名】 【生年月日】、発行番号　発行日　発行者、が読める',
        guideText: '隠さない項目\n・戸籍上の【姓】（苗字）\n・ご本人に関する【名】【生年月日】\n・発行番号　発行日　発行者',
      ),
      CertificateType.familyRegisterExtract: const CertificateConfirmTexts(
        text1: '「本籍地」「従前戸籍情報」を黒く塗りつぶすか、紙や付箋、テープなどで隠した',
        text2: '戸籍上の【姓】（苗字）、ご本人に関する【名】 【生年月日】、発行番号　発行日　発行者、が読める',
        guideText: '隠さない項目\n・戸籍上の【姓】（苗字）\n・ご本人に関する【名】【生年月日】\n・発行番号　発行日　発行者',
      ),
    };
  }

  /// 指定された証明書タイプの確認テキストを取得
  CertificateConfirmTexts getTextsForType(CertificateType type) {
    return state[type] ?? const CertificateConfirmTexts();
  }
}

/// 証明書確認テキストを表すクラス
class CertificateConfirmTexts {
  const CertificateConfirmTexts({
    this.text1 = '',
    this.text2 = '',
    this.guideText = '',
  });

  /// チェックボックス1のテキスト
  final String text1;
  
  /// チェックボックス2のテキスト
  final String text2;
  
  /// ガイドテキスト
  final String guideText;
}

/// 証明書タイプ別の確認テキスト1取得プロバイダー
@riverpod
String confirmText1ForCertificateType(Ref ref, CertificateType certificateType) {
  final textSettings = ref.watch(certificateConfirmTextViewModelProvider);
  return textSettings[certificateType]?.text1 ?? '';
}

/// 証明書タイプ別の確認テキスト2取得プロバイダー
@riverpod
String confirmText2ForCertificateType(Ref ref, CertificateType certificateType) {
  final textSettings = ref.watch(certificateConfirmTextViewModelProvider);
  return textSettings[certificateType]?.text2 ?? '';
}

/// 証明書タイプ別のガイドテキスト取得プロバイダー
@riverpod
String confirmGuideTextForCertificateType(Ref ref, CertificateType certificateType) {
  final textSettings = ref.watch(certificateConfirmTextViewModelProvider);
  return textSettings[certificateType]?.guideText ?? '';
}

/// 証明書タイプ別の遷移先取得プロバイダー（Aポリシー：一時的にリテラルパス）
@riverpod
String confirmTransitionDestinationForCertificateType(Ref ref, CertificateType certificateType) {
  switch (certificateType) {
    case CertificateType.single:
      return '/confirm-single';
    case CertificateType.familyRegister:
      return '/confirm-family-register';
    case CertificateType.familyRegisterExtract:
      return '/confirm-family-register-extract';
  }
}

