class ApiConstants {
  factory ApiConstants() => _instance;
  ApiConstants._internal();
  static final ApiConstants _instance = ApiConstants._internal();

  // APIのベースURL
  // static const String baseUrl = 'http://192.168.0.202:8080';
  static const String baseUrl = 'https://api.esst.lavigation.com';

  // タイムアウト設定
  static const Duration timeout = Duration(seconds: 30);

  // リトライ設定
  static const int maxRetries = 5;
  static const Duration retryDelay = Duration(seconds: 1);
}

enum ApiMethodUnary {
  // チャットルーム関連
  createChatRoom,
  getChatRooms,
  getCounselingChatRoom,
  getSimulatorChatRooms,
  getScheduledChatRooms,
  leaveSimulatorChatRoom,
  leaveCounselingChatRoom,
  updatePushNoticeStatus,
  updateVisibleStatus,

  // チャット関連
  createChatTopics,
  createPersonaGreeting,
  createPersonaReply,
  getChatTopics,
  purchaseForceReadStatus,
  getDateIntention,
  getMessages,
  publishChatMessage,
  publishDisconnectChatSession,
  publishMessageRead,
  publishUserTyping,
  updateDateIntention,
  updatePinnedChatMessage,

  // ユーザー関連
  createUserAgreementLog,
  createUserBoost,
  getUserAgreementLog,
  getUserBoost,
  getExternalUser,
  createExternalUser,
  getUserInquiries,
  getUserPrivateMode,
  getUserPoints,
  getUserPointHistory,
  getUserSettings,
  getUserStatus,
  updateUserSettings,
  updateUserStatus,
  upsertUserPrivateMode,
  getIdeal,
  getApproachAnalysis,
  withdrawUser,

  // お気に入り関連
  getFavoriteUsers,
  updateUserFavorite,

  // プロフィール関連
  getProfile,
  createProfile,
  updateProfile,

  // 公開API関連
  getServerInfo,

  // photo関連
  updateProfilePhotoCaption,
  updateProfilePhotoDisplayOrder,
  deleteProfilePhoto,

  // カルテ関連
  getKarte,

  //search関連
  getAffinityRecommendationUsers,
  getRecommendationUsers,
  getLatestUserSearchConditions,
  getSearchUsers,

  // マッチング関連
  createAppeal,
  createLike,
  createSkip,
  getLikes,
  getSkips,
  deleteSkip,

  // 足あと関連
  getFootprints,

  // 非表示関連
  getHiddenUsers,
  updateUserHide,

  // ブロック関連
  getBlockedUsers,
  updateUserBlock,

  // 決済関連
  restoreSubscriptions,

  // グローバル関連
  getNotifications,
  markNotificationsAsRead,
  getNotificationSettings,
  updateNotificationSettings,
  getAnnouncements,
  publishNotification,

  // タグ関連
  createUserTag,
  deleteUserTag,
  getTagCategories,
  getTags,
  getUserTags,

  // 登録関連
  createRegistrationStepLog,
  getLatestRegistrationStep,

  // GMOEkyc
  getServiceAuth,

  // 質問関連
  approveQuestion,
  createQuestion,
  deleteQuestionAnswer,
  deleteQuestion,
  getApprovedQuestions,
  updateQuestionAnswer,

}

enum ApiMethodStream {
  subscribeChatSession,
  subscribeQuestionSession,
  subscribeNotificationSession,
}

// ClientStream -> SingleResponse
enum ApiMethodClientStream {
  chunkedMediaUpload,
}