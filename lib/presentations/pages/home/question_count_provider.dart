import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/moderation_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/get_approved_questions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionCountProvider = FutureProvider.autoDispose<int>((ref) async {
  try {
    final repository = ref.read(questionRepositoryProvider);
    final response = await repository.getApprovedQuestions(
      GetApprovedQuestionsRequest(
        isFromMe: false,
        moderationStatusCode:
        ModerationStatusCode.MODERATION_STATUS_CODE_APPROVED,
        cursor: PagerRequestCursor(limit: 1),
      ),
    );
    if (response.hasCursor() && response.cursor.hasTotalCount()) {
      return response.cursor.totalCount;
    }

    return response.questions.length;
  } on Exception catch (_) {
    return 0;
  }
});