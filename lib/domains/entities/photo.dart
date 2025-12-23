import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

/// 写真モデル
@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    /// 写真ID
    required String id,

    /// 写真のURL
    required String url,

    /// 作成日時
    required DateTime createdAt,

    /// 更新日時
    required DateTime updatedAt,

    /// キャプション
    String? caption,

    /// 写真のサイズ
  }) = _Photo;

  const Photo._();

/// APIレスポンスからエンティティを作成
//factory Photo.fromResponse(dynamic response) {
// TODO(DaichiSasaki): proto定義が完了したら実装
// return Photo(
//   id: response.id,
//   url: response.url,
//   caption: response.caption,
//   createdAt: DateTime.parse(response.createdAt),
//   updatedAt: DateTime.parse(response.updatedAt),
// );
// }
}
