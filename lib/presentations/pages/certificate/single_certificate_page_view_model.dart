import 'dart:io';

import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/enums/certificate_type.dart';
import 'package:econa_mobile_app/presentations/enums/processing_type.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/single_certificate_page_state.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_certificate_page_view_model.g.dart';

/// 証明書認証ページのViewModel
@riverpod
class SingleCertificatePageViewModel extends _$SingleCertificatePageViewModel {
  @override
  SingleCertificatePageState build() {
    return const SingleCertificatePageState();
  }

  /// 画像キャプチャ後の処理
  void handleCapturedImage(BuildContext context, File imageFile, CertificateType certificateType) {
    state = state.copyWith(
      isProcessing: true,
      processingType: ProcessingType.imageProcessing,
      error: null,
    );
    
    try {
      state = state.copyWith(processingType: ProcessingType.validation);
      final transitionDestination = _getTransitionDestination(certificateType);
      
      if (transitionDestination.isNotEmpty) {
        state = state.copyWith(processingType: ProcessingType.navigation);

        // 撮影した写真を渡すためにcontext.pushで遷移
        context.push(
          transitionDestination,
          extra: {
            'imageFile': imageFile,
            'certificateType': certificateType,
          },
        );
        if (certificateType == CertificateType.single) {
          AdjustEventTracker.trackSingleVerification();
        }
      } else {
        state = state.copyWith(error: '不正な証明書タイプです');
      }
    } catch (e) {
      state = state.copyWith(error: '画像処理中にエラーが発生しました: ${e.toString()}');
    } finally {
      state = state.copyWith(
        isProcessing: false,
        processingType: null,
      );
    }
  }

  /// 証明書タイプごとの遷移先を取得
  String _getTransitionDestination(CertificateType certificateType) {
    switch (certificateType) {
      case CertificateType.single:
        return const ConfirmSingleRouteData().location;
      case CertificateType.familyRegister:
        return const ConfirmFamilyRegisterRouteData().location;
      case CertificateType.familyRegisterExtract:
        return const ConfirmFamilyRegisterExtractRouteData().location;
    }
  }

  /// エラーをクリア
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// カメラ設定管理のプロバイダー
@riverpod
class CameraSettingsViewModel extends _$CameraSettingsViewModel {
  @override
  Map<CertificateType, CameraSettings> build() {
    return {
      CertificateType.single: const CameraSettings(
        guideText: '',
        instructionText: '書類を真上から枠に収まるよう\n撮影してください',
      ),
      CertificateType.familyRegister: const CameraSettings(
        guideText: '隠さない項目\n・戸籍上の【姓】（苗字）\n・ご本人に関する【名】【生年月日】\n・発行番号　発行日　発行者',
        instructionText: '書類を真上から枠に収まるよう\n撮影してください',
      ),
      CertificateType.familyRegisterExtract: const CameraSettings(
        guideText: '隠さない項目\n・戸籍上の【姓】（苗字）\n・ご本人に関する【名】【生年月日】\n・発行番号　発行日　発行者',
        instructionText: '書類を真上から枠に収まるよう\n撮影してください',
      ),
    };
  }

  /// 指定された証明書タイプのカメラ設定を取得
  CameraSettings getSettingsForType(CertificateType type) {
    return state[type] ?? const CameraSettings();
  }
}

/// カメラ設定を表すクラス
class CameraSettings {
  const CameraSettings({
    this.guideText = '',
    this.instructionText = '書類を真上から枠に収まるよう\n撮影してください',
  });

  /// ガイドテキスト
  final String guideText;
  
  /// 撮影指示テキスト
  final String instructionText;
}

/// 証明書タイプ別のガイドテキスト取得プロバイダー
@riverpod
String guideTextForCertificateType(Ref ref, CertificateType certificateType) {
  final cameraSettings = ref.watch(cameraSettingsViewModelProvider);
  return cameraSettings[certificateType]?.guideText ?? '';
}

/// 証明書タイプ別の撮影指示テキスト取得プロバイダー
@riverpod
String instructionTextForCertificateType(Ref ref, CertificateType certificateType) {
  final cameraSettings = ref.watch(cameraSettingsViewModelProvider);
  return cameraSettings[certificateType]?.instructionText ?? '書類を真上から枠に収まるよう\n撮影してください';
}

/// 遷移先パス取得プロバイダー
@riverpod
String transitionDestinationForCertificateType(Ref ref, CertificateType certificateType) {
  return switch (certificateType) {
    CertificateType.single => const ConfirmSingleRouteData().location,
    CertificateType.familyRegister => const ConfirmFamilyRegisterRouteData().location,
    CertificateType.familyRegisterExtract => const ConfirmFamilyRegisterExtractRouteData().location,
  };
}

/// 証明書タイプ別の確認テキスト取得プロバイダー
@riverpod
List<String> confirmationTextsForCertificateType(Ref ref, CertificateType certificateType) {
  return switch (certificateType) {
    CertificateType.single =>
      [
        '撮影した画像に光源が写り込んだり、白飛びしたりしていない',
        '一部が見切れたり、ぼやけておらず、文字を正確に読み取ることができる',
      ],
    CertificateType.familyRegister ||
    CertificateType.familyRegisterExtract =>
       [
        '「本籍地」「従前戸籍情報」を黒く塗りつぶすか、紙や付箋、テープなどで隠した',
        '戸籍上の【姓】（苗字）、ご本人に関する【名】 【生年月日】、発行番号　発行日　発行者、が読める',
      ],
  };
}
