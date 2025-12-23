import 'package:econa_mobile_app/domains/entities/profile_label_keys.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/area_search_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/body_type_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/child_situation_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/distance_location_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/smoking_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/master/regions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_latest_user_search_conditions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_search_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_search_conditions.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_selector.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/helpers/label_localizer.dart';
import 'package:econa_mobile_app/presentations/pages/home/home_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/regions/regions.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// モーダルボトムシートウィジェット
class EconaModalBottomSheet extends ConsumerStatefulWidget {
  const EconaModalBottomSheet({
    this.initialConditions,
    super.key,
  });

  final UserSearchConditions? initialConditions;

  @override
  ConsumerState<EconaModalBottomSheet> createState() =>
      _EconaModalBottomSheetState();
}

class _EconaModalBottomSheetState extends ConsumerState<EconaModalBottomSheet> {
  bool _isDistanceSearchEnabled = false;

  List<Region>? _selectedResidence;
  DistanceLocationCode? _distanceLocationCode;
  int? _minAge;
  int? _maxAge;
  int? _minHeight;
  int? _maxHeight;
  List<BodyTypeCode> _selectedBodyTypeCodes = [];
  List<SmokingCode> _selectedSmokingCodes = [];
  List<ChildSituationCode> _selectedChildSituationCodes = [];

  @override
  void initState() {
    super.initState();

    void applyConditions(UserSearchConditions conditions) {
      _isDistanceSearchEnabled = conditions.areaSearchType ==
          AreaSearchType.AREA_SEARCH_TYPE_DISTANCE_LOCATION;
      _selectedResidence = conditions.residenceRegions.regions;
      _distanceLocationCode = conditions.distanceLocationCode ==
              DistanceLocationCode.DISTANCE_LOCATION_CODE_UNSPECIFIED
          ? DistanceLocationCode.DISTANCE_LOCATION_CODE_200_KM
          : conditions.distanceLocationCode;
      _minAge = conditions.minAge == 0 ? 18 : conditions.minAge;
      _maxAge = conditions.maxAge == 0 ? 49 : conditions.maxAge;
      _minHeight = conditions.minHeight == 0 ? 130 : conditions.minHeight;
      _maxHeight = conditions.maxHeight == 0 ? 200 : conditions.maxHeight;
      _selectedBodyTypeCodes = conditions.bodyTypeCodes;
      _selectedSmokingCodes = conditions.smokingCodes;
      _selectedChildSituationCodes = conditions.childSituationCodes;
    }

    // 初期条件が渡されていれば同期適用
    if (widget.initialConditions != null) {
      applyConditions(widget.initialConditions!);
      return;
    }

    // フォールバック: 非同期で取得
    Future.microtask(() async {
      final homePageViewModel = ref.read(homePageViewModelProvider.notifier);
      final response = await homePageViewModel.getLatestUserSearchConditions(
        GetLatestUserSearchConditionsRequest(),
      );
      final conditions = response.userSearchConditions;

      setState(() {
        applyConditions(conditions);
      });
    });
  }

  void _resetToDefaults() {
    setState(() {
      _isDistanceSearchEnabled = false;
      _selectedResidence = null;
      _distanceLocationCode =
          DistanceLocationCode.DISTANCE_LOCATION_CODE_200_KM;
      _minAge = 18;
      _maxAge = 49;
      _minHeight = 130;
      _maxHeight = 200;
      _selectedBodyTypeCodes = [];
      _selectedSmokingCodes = [];
      _selectedChildSituationCodes = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePageViewModel = ref.read(homePageViewModelProvider.notifier);

    return PopScope(
      canPop: false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            // 1つ目のシャドウ: X: -4, Y: -4, Blur: 20, Color: #3E4AB5 (24%)
            BoxShadow(
              offset: const Offset(-4, -4),
              blurRadius: 20,
              spreadRadius: 0,
              color: const Color(0xFF3E4AB5).withValues(alpha: 0.24),
            ),
            // 2つ目のシャドウ: X: -6, Y: -6, Blur: 20, Color: #FFFFFF
            const BoxShadow(
              offset: Offset(-6, -6),
              blurRadius: 20,
              spreadRadius: 0,
              color: Colors.white,
            ),
            // 3つ目のシャドウ: X: -2, Y: -2, Blur: 4, Color: #7273AB (10%)
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 4,
              spreadRadius: 0,
              color: const Color(0xFF7273AB).withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFD6E3F3),
                Colors.white,
              ],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
              color: EconaColor.surfaceModal,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19),
                topRight: Radius.circular(19),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 4),
                    child: Header(
                      onReset: _resetToDefaults,
                    ),
                  ),
                  // ディビジョンバー
                  const DivisionBar(),
                  // エリアと距離検索
                  AreaSubHeader(
                    isChecked: _isDistanceSearchEnabled,
                    onDistanceSearchChanged: ({required bool isChecked}) {
                      setState(() {
                        _isDistanceSearchEnabled = isChecked;
                      });
                    },
                  ),
                  const DivisionBar(),
                  const SizedBox(height: 18),
                  // 居住地
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IgnorePointer(
                      ignoring: _isDistanceSearchEnabled,
                      child: Opacity(
                        opacity: !_isDistanceSearchEnabled ? 1.0 : 0.4,
                        child: SelectionWidget(
                          leftIcon: Assets.images.icons.residence,
                          labelText: '居住地',
                          valueText: _selectedResidence == null ||
                                  _selectedResidence!.isEmpty
                              ? '未選択'
                              : _selectedResidence!
                                  .map((r) => r.name)
                                  .join('、'),
                          rightIcon: Assets.images.icons.forward,
                          onValueTap: () async {
                            await Navigator.of(context).push<Widget>(
                              MaterialPageRoute<Widget>(
                                builder: (context) => ProfileBaseSelector(
                                  title: '居住地',
                                  items: prefectureRegions,
                                  itemBuilder: (item) => (item as Region).name,
                                  isMultiple: true,
                                  getInitialIndices: () {
                                    if (_selectedResidence == null ||
                                        _selectedResidence!.isEmpty) {
                                      return <int>{};
                                    }
                                    final indices = <int>{};
                                    for (final r in _selectedResidence!) {
                                      final idx = prefectureRegions.indexWhere(
                                        (region) => region.id == r.id,
                                      );
                                      if (idx != -1) {
                                        indices.add(idx);
                                      }
                                    }
                                    return indices;
                                  },
                                  valueConverter: (i) => prefectureRegions[i],
                                  onSave: (values) async {
                                    if (values == null) {
                                      setState(() {
                                        _selectedResidence = null;
                                      });
                                      return;
                                    }
                                    final selected = (values as List<dynamic>)
                                        .cast<Region>()
                                        .toList();
                                    // prefectureRegionsの順序でソートして保存
                                    final sorted = prefectureRegions
                                        .where((r) => selected.any(
                                              (s) => s.id == r.id,
                                            ),)
                                        .toList();
                                    setState(() {
                                      _selectedResidence =
                                          sorted.isEmpty ? null : sorted;
                                    });
                                  },
                                  successMessage: '居住地を保存しました',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 距離検索
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 7),
                    child: IgnorePointer(
                      ignoring: !_isDistanceSearchEnabled,
                      child: Opacity(
                        opacity: _isDistanceSearchEnabled ? 1.0 : 0.4,
                        child: SelectionWithDistanceSlider(
                          key: ValueKey('distance_$_distanceLocationCode'),
                          leftIcon: Assets.images.icons.gps,
                          labelText: '現在地から',
                          rightIcon: Assets.images.icons.forward,
                          onValueTap: () {},
                          initialCode: _distanceLocationCode ??
                              DistanceLocationCode
                                  .DISTANCE_LOCATION_CODE_200_KM,
                          onChanged: (code) {
                            setState(() {
                              _distanceLocationCode = code;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const DivisionBar(),
                  const PersonalSubHeader(),
                  const DivisionBar(),
                  const SizedBox(height: 13),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 7),
                    child: SelectionWithSlider(
                      key: ValueKey('age_${_minAge}_$_maxAge'),
                      leftIcon: Assets.images.icons.birthdayCake,
                      labelText: '年齢',
                      rightIcon: Assets.images.icons.forward,
                      onValueTap: () {},
                      min: 18,
                      max: 49,
                      initialMin: _minAge ?? 18,
                      initialMax: _maxAge ?? 49,
                      unit: '歳',
                      onRangeChanged: (min, max) {
                        setState(() {
                          _minAge = min;
                          _maxAge = max;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 7),
                    child: SelectionWithSlider(
                      key: ValueKey('height_${_minHeight}_$_maxHeight'),
                      leftIcon: Assets.images.icons.height,
                      labelText: '身長',
                      rightIcon: Assets.images.icons.forward,
                      onValueTap: () {},
                      min: 130,
                      max: 200,
                      initialMin: _minHeight ?? 130,
                      initialMax: _maxHeight ?? 200,
                      unit: 'cm',
                      onRangeChanged: (min, max) {
                        setState(() {
                          _minHeight = min;
                          _maxHeight = max;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 7),
                    child: SelectionWidget(
                      leftIcon: Assets.images.icons.bodyShape,
                      labelText: '体型',
                      valueText: _selectedBodyTypeCodes.isEmpty
                          ? '未選択'
                          : _selectedBodyTypeCodes.map((e) {
                              return localizeLabel(e.labelKey);
                            }).join('、'),
                      rightIcon: Assets.images.icons.forward,
                      onValueTap: () async {
                        const bodyTypeCodeList = BodyTypeCode.values;
                        await Navigator.of(context).push<Widget>(
                          MaterialPageRoute<Widget>(
                            builder: (context) => ProfileBaseSelector(
                              title: '体型',
                              items: bodyTypeCodeList,
                              itemBuilder: (item) {
                                return localizeLabel(
                                  (item as BodyTypeCode).labelKey,
                                );
                              },
                              isMultiple: true,
                              getInitialIndices: () {
                                final indices = <int>{};
                                for (var i = 0;
                                    i < bodyTypeCodeList.length;
                                    i++) {
                                  if (_selectedBodyTypeCodes
                                      .contains(bodyTypeCodeList[i])) {
                                    indices.add(i);
                                  }
                                }
                                return indices;
                              },
                              valueConverter: (i) => bodyTypeCodeList[i],
                              onSave: (values) async {
                                if (values == null) {
                                  setState(() {
                                    _selectedBodyTypeCodes = [];
                                  });
                                  return;
                                }
                                final selectedSet = (values as List)
                                    .cast<BodyTypeCode>()
                                    .toSet();
                                // BodyTypeCode.valuesの順序でソートして保存
                                final sorted = bodyTypeCodeList
                                    .where(selectedSet.contains)
                                    .toList();
                                setState(() {
                                  _selectedBodyTypeCodes = sorted;
                                });
                              },
                              successMessage: '体型を保存しました',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 7),
                    child: SelectionWidget(
                      leftIcon: Assets.images.icons.smoking,
                      labelText: 'タバコ',
                      valueText: _selectedSmokingCodes.isEmpty
                          ? '未選択'
                          : _selectedSmokingCodes.map((e) {
                              return localizeLabel(e.labelKey);
                            }).join('、'),
                      rightIcon: Assets.images.icons.forward,
                      onValueTap: () async {
                        const smokingCodeList = SmokingCode.values;
                        await Navigator.of(context).push<Widget>(
                          MaterialPageRoute<Widget>(
                            builder: (context) => ProfileBaseSelector(
                              title: 'タバコ',
                              items: smokingCodeList,
                              itemBuilder: (item) {
                                return localizeLabel(
                                  (item as SmokingCode).labelKey,
                                );
                              },
                              isMultiple: true,
                              getInitialIndices: () {
                                final indices = <int>{};
                                for (var i = 0;
                                    i < smokingCodeList.length;
                                    i++) {
                                  if (_selectedSmokingCodes
                                      .contains(smokingCodeList[i])) {
                                    indices.add(i);
                                  }
                                }
                                return indices;
                              },
                              valueConverter: (i) => smokingCodeList[i],
                              onSave: (values) async {
                                if (values == null) {
                                  setState(() {
                                    _selectedSmokingCodes = [];
                                  });
                                  return;
                                }
                                final selectedSet = (values as List)
                                    .cast<SmokingCode>()
                                    .toSet();
                                // SmokingCode.valuesの順序でソートして保存
                                final sorted = smokingCodeList
                                    .where(selectedSet.contains)
                                    .toList();
                                setState(() {
                                  _selectedSmokingCodes = sorted;
                                });
                              },
                              successMessage: 'タバコを保存しました',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 7),
                    child: SelectionWidget(
                      leftIcon: Assets.images.icons.child,
                      labelText: '子供の有無',
                      valueText: _selectedChildSituationCodes.isEmpty
                          ? '未選択'
                          : _selectedChildSituationCodes.map((e) {
                              return localizeLabel(e.labelKey);
                            }).join('、'),
                      rightIcon: Assets.images.icons.forward,
                      onValueTap: () async {
                        const childSituationCodeList =
                            ChildSituationCode.values;
                        await Navigator.of(context).push<Widget>(
                          MaterialPageRoute<Widget>(
                            builder: (context) => ProfileBaseSelector(
                              title: '子供の有無',
                              items: childSituationCodeList,
                              itemBuilder: (item) {
                                return localizeLabel(
                                  (item as ChildSituationCode).labelKey,
                                );
                              },
                              isMultiple: true,
                              getInitialIndices: () {
                                final indices = <int>{};
                                for (var i = 0;
                                    i < childSituationCodeList.length;
                                    i++) {
                                  if (_selectedChildSituationCodes
                                      .contains(childSituationCodeList[i])) {
                                    indices.add(i);
                                  }
                                }
                                return indices;
                              },
                              valueConverter: (i) => childSituationCodeList[i],
                              onSave: (values) async {
                                if (values == null) {
                                  setState(() {
                                    _selectedChildSituationCodes = [];
                                  });
                                  return;
                                }
                                final selectedSet = (values as List)
                                    .cast<ChildSituationCode>()
                                    .toSet();
                                // ChildSituationCode.valuesの順序でソートして保存
                                final sorted = childSituationCodeList
                                    .where(selectedSet.contains)
                                    .toList();
                                setState(() {
                                  _selectedChildSituationCodes = sorted;
                                });
                              },
                              successMessage: '子供の有無を保存しました',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 34),
                  // 検索ボタン
                  Padding(
                    padding: const EdgeInsets.only(right: 24, bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        EconaGradientButton(
                          text: '検索',
                          onPressed: () {
                            homePageViewModel.getSearchUsers(
                              GetSearchUsersRequest(
                                userSearchConditions: () {
                                  final conditions = UserSearchConditions();
                                  // 距離検索
                                  if (_isDistanceSearchEnabled &&
                                      _distanceLocationCode != null) {
                                    conditions
                                      ..areaSearchType = AreaSearchType
                                          .AREA_SEARCH_TYPE_DISTANCE_LOCATION
                                      ..distanceLocationCode =
                                          _distanceLocationCode!;
                                  } else {
                                    // 居住地（距離検索が無効な場合）
                                    conditions
                                      ..areaSearchType = AreaSearchType
                                          .AREA_SEARCH_TYPE_RESIDENCE_REGIONS
                                      ..residenceRegions =
                                          UserSearchConditionsResidenceRegions(
                                        regions: _selectedResidence ?? [],
                                      );
                                  }

                                  // 年齢
                                  if (_minAge != null) {
                                    conditions.minAge = _minAge!;
                                  }
                                  if (_maxAge != null) {
                                    conditions.maxAge = _maxAge!;
                                  }
                                  // 身長
                                  if (_minHeight != null) {
                                    conditions.minHeight = _minHeight!;
                                  }
                                  if (_maxHeight != null) {
                                    conditions.maxHeight = _maxHeight!;
                                  }
                                  // 体型/タバコ/子供の有無
                                  if (_selectedBodyTypeCodes.isNotEmpty) {
                                    conditions.bodyTypeCodes.addAll(
                                      _selectedBodyTypeCodes,
                                    );
                                  }
                                  if (_selectedSmokingCodes.isNotEmpty) {
                                    conditions.smokingCodes.addAll(
                                      _selectedSmokingCodes,
                                    );
                                  }
                                  if (_selectedChildSituationCodes.isNotEmpty) {
                                    conditions.childSituationCodes.addAll(
                                      _selectedChildSituationCodes,
                                    );
                                  }
                                  return conditions;
                                }(),
                                cursor: PagerRequestCursor(limit: 20),
                              ),
                            );
                            context.pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    required this.onReset,
    super.key,
  });

  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InnerShadowText(
          text: '絞り込み',
          textStyle: EconaTextStyle.labelMedium2140(
            color: EconaColor.gray200,
          ),
          innerShadowTextStyles: [
            EconaTextStyle.labelMedium2140(
              foreground: EconaShadow().headlineInnerShadow,
            ),
          ],
        ),
        const Spacer(),
        // 右側のリセットボタンとXアイコン
        GestureDetector(
          onTap: onReset,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              'リセット',
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayNormal,
              ),
            ),
          ),
        ),
        // Xアイコン
        IconButton(
          icon: Assets.images.icons.close.image(
            height: 24,
            width: 24,
          ),
          iconSize: 40,
          padding: EdgeInsets.zero,
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}

/// ディビジョンバーウィジェット
class DivisionBar extends StatelessWidget {
  const DivisionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
        boxShadow: [
          // 1つ目のシャドウ: X: 4, Y: 4, Blur: 20, Color: #6F75B0 (20%)
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: const Color(0xFF6F75B0).withValues(alpha: 0.2),
          ),
          // 2つ目のシャドウ: X: -6, Y: -6, Blur: 20, Color: #FFFFFF
          const BoxShadow(
            offset: Offset(-6, -6),
            blurRadius: 20,
            spreadRadius: 0,
            color: Colors.white,
          ),
          // 3つ目のシャドウ: X: 2, Y: 2, Blur: 4, Color: #7273AB (10%)
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: const Color(0xFF7273AB).withValues(alpha: 0.1),
          ),
        ],
      ),
    );
  }
}

/// エリアと距離検索ウィジェット
class AreaSubHeader extends StatelessWidget {
  const AreaSubHeader({
    required this.isChecked,
    required this.onDistanceSearchChanged,
    super.key,
  });

  final bool isChecked;
  final void Function({required bool isChecked}) onDistanceSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EconaColor.bg,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: GestureDetector(
        onTap: () {
          onDistanceSearchChanged(isChecked: !isChecked);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 左側の「エリア」ラベル
            Text(
              'エリア',
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayNormal,
              ),
            ),
            const Spacer(),
            // 右側のチェックアイコン（見た目のみ、タップは外側で処理）
            SizedBox(
              width: 16,
              height: 16,
              child: (isChecked
                      ? Assets.images.icons.checkDone
                      : Assets.images.icons.checkPng)
                  .image(
                height: 16,
                width: 16,
              ),
            ),
            const SizedBox(width: 8),
            // 「距離で検索する」テキスト
            Text(
              '距離で検索する',
              textAlign: TextAlign.center,
              style: EconaTextStyle.regularSmall140(
                color: EconaColor.purpleNormal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalSubHeader extends StatelessWidget {
  const PersonalSubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EconaColor.bg,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Text(
            'パーソナル',
            style: EconaTextStyle.labelSmall140(
              color: EconaColor.grayNormal,
            ),
          ),
        ],
      ),
    );
  }
}

/// 選択ウィジェット
class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    required this.leftIcon,
    required this.labelText,
    required this.valueText,
    required this.rightIcon,
    required this.onValueTap,
    super.key,
    this.leftIconSize = 24.0,
    this.rightIconSize = 16.0,
  });

  final AssetGenImage leftIcon;
  final String labelText;
  final String valueText;
  final AssetGenImage rightIcon;
  final VoidCallback onValueTap;
  final double leftIconSize;
  final double rightIconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onValueTap,
      child: SizedBox(
        height: 44,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 左のアイコン
            SizedBox(
              width: leftIconSize,
              height: leftIconSize,
              child: leftIcon.image(
                height: leftIconSize,
                width: leftIconSize,
              ),
            ),
            const SizedBox(width: 8),
            // ラベルテキスト
            InnerShadowText(
              text: labelText,
              textStyle: EconaTextStyle.labelSmall140(
                color: EconaColor.gray200,
              ),
              innerShadowTextStyles: [
                EconaTextStyle.labelSmall140(
                  foreground: EconaShadow().headlineInnerShadow,
                ),
              ],
            ),
            const SizedBox(width: 56),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 値テキスト
                  Flexible(
                    child: Text(
                      valueText,
                      style: EconaTextStyle.regularSmall140(
                        color: EconaColor.purpleNormal,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // 右のアイコンボタン
                  SizedBox(
                    width: rightIconSize,
                    height: rightIconSize,
                    child: rightIcon.image(
                      height: rightIconSize,
                      width: rightIconSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 非選択領域のバーウィジェット
class UnselectedRegionBar extends StatelessWidget {
  const UnselectedRegionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: EconaColor.purpleLight,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          // ドロップシャドウ: X: -1, Y: -1, Blur: 3, Color: #FFFFFF (80%)
          BoxShadow(
            offset: const Offset(-1, -1),
            blurRadius: 3,
            spreadRadius: 0,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            // 内側シャドウ: X: 2, Y: 2, Blur: 3, Color: #353E72 (30%)
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 3,
              spreadRadius: 0,
              color: const Color(0xFF353E72).withValues(alpha: 0.2),
            ),
          ],
        ),
      ),
    );
  }
}

/// つまみの丸（スライダーのサム）ウィジェット
class SliderThumb extends StatelessWidget {
  const SliderThumb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: EconaColor.surfaceModal,
        borderRadius: BorderRadius.circular(100), // 完全に丸い
        border: Border.all(
          width: 1,
          color: Colors.transparent, // ボーダーは透明
        ),
        boxShadow: [
          // Drop shadow (1つ目): X: 4, Y: 4, Blur: 20, Color: #6F75B0 (24%)
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: const Color(0xFF6F75B0).withValues(alpha: 0.24),
          ),
          // Inner shadow (1つ目): X: 4, Y: 4, Blur: 14, Color: #C1D5EE (80%)
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 14,
            spreadRadius: 0,
            color: const Color(0xFFC1D5EE).withValues(alpha: 0.8),
          ),
          // Inner shadow (2つ目): X: -4, Y: -4, Blur: 9, Color: #FFFFFF (88%)
          BoxShadow(
            offset: const Offset(-4, -4),
            blurRadius: 9,
            spreadRadius: 0,
            color: Colors.white.withValues(alpha: 0.88),
          ),
          // Drop shadow (2つ目): X: -2, Y: 2, Blur: 4, Color: #7273AB (10%)
          BoxShadow(
            offset: const Offset(-2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: const Color(0xFF7273AB).withValues(alpha: 0.1),
          ),
          // Drop shadow (3つ目): X: 0, Y: 4, Blur: 4, Color: #1F1F60 (10%)
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: const Color(0xFF1F1F60).withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD6E3F3), // グラデーション開始色
              Colors.white, // グラデーション終了色
            ],
          ),
        ),
      ),
    );
  }
}

/// 選択領域のバーウィジェット
class SelectedRegionBar extends StatelessWidget {
  const SelectedRegionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: EconaColor.purpleNormal,
        borderRadius: BorderRadius.circular(100), // 完全に丸い端
        border: Border.all(
          width: 1,
          color: EconaColor.purpleNormal,
        ),
      ),
    );
  }
}

/// スライダーウィジェット
class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _leftThumbPosition = 50;
  double _rightThumbPosition = 200;
  final double _minPosition = 0;
  double _maxPosition = 276; // 動的に計算される

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 利用可能な幅に基づいて_maxPositionを計算
        _maxPosition = constraints.maxWidth - 24; // スライダー幅 - つまみ幅

        return SizedBox(
          width: constraints.maxWidth, // 利用可能な幅全体を使用
          height: 34,
          child: Stack(
            children: [
              // トラック（バー）の背景
              Positioned(
                top: 10, // つまみの中央に合わせる
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左側の非選択領域
                    SizedBox(
                      width: _leftThumbPosition,
                      child: const UnselectedRegionBar(),
                    ),
                    // 選択領域（つまみの間）
                    SizedBox(
                      width: _rightThumbPosition - _leftThumbPosition, // 動的な幅
                      child: const SelectedRegionBar(),
                    ),
                    // 右側の非選択領域
                    const Expanded(
                      child: UnselectedRegionBar(),
                    ),
                  ],
                ),
              ),
              // 左側のつまみ
              Positioned(
                left: _leftThumbPosition,
                top: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      final double newPosition =
                          _leftThumbPosition + details.delta.dx;
                      // 右つまみより左に、かつ最小位置より右に制限
                      if (newPosition >= _minPosition &&
                          newPosition <= _rightThumbPosition - 24) {
                        _leftThumbPosition = newPosition;
                      }
                    });
                  },
                  child: const SliderThumb(),
                ),
              ),
              // 右側のつまみ
              Positioned(
                left: _rightThumbPosition,
                top: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      final double newPosition =
                          _rightThumbPosition + details.delta.dx;
                      // 左つまみより右に、かつ最大位置より左に制限
                      if (newPosition >= _leftThumbPosition + 24 &&
                          newPosition <= _maxPosition) {
                        _rightThumbPosition = newPosition;
                      }
                    });
                  },
                  child: const SliderThumb(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// コールバック付きスライダーウィジェット
class CustomSliderWithCallback extends StatefulWidget {
  const CustomSliderWithCallback({
    required this.onPositionsChanged,
    required this.onPositionsChangeEnd,
    this.initialLeftRatio,
    this.initialRightRatio,
    super.key,
  });

  final void Function(
    double leftPosition,
    double rightPosition,
    double maxPosition,
  ) onPositionsChanged;

  final void Function(
    double leftPosition,
    double rightPosition,
    double maxPosition,
  ) onPositionsChangeEnd;

  final double? initialLeftRatio;
  final double? initialRightRatio;

  @override
  State<CustomSliderWithCallback> createState() =>
      _CustomSliderWithCallbackState();
}

class _CustomSliderWithCallbackState extends State<CustomSliderWithCallback> {
  double _leftThumbPosition = 50;
  double _rightThumbPosition = 200;
  final double _minPosition = 0;
  double _maxPosition = 276;
  bool _isInitialized = false;

  @override
  void didUpdateWidget(covariant CustomSliderWithCallback oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialLeftRatio != oldWidget.initialLeftRatio ||
        widget.initialRightRatio != oldWidget.initialRightRatio) {
      _isInitialized = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 利用可能な幅に基づいて_maxPositionを計算
        _maxPosition = constraints.maxWidth - 24; // スライダー幅 - つまみ幅

        if (!_isInitialized &&
            (widget.initialLeftRatio != null ||
                widget.initialRightRatio != null)) {
          final l =
              (widget.initialLeftRatio ?? (_leftThumbPosition / _maxPosition))
                  .clamp(0.0, 1.0);
          final r =
              (widget.initialRightRatio ?? (_rightThumbPosition / _maxPosition))
                  .clamp(0.0, 1.0);

          final left = l * _maxPosition;
          double right = r * _maxPosition;
          if (right < left + 24) right = (left + 24).clamp(0, _maxPosition);

          _leftThumbPosition = left;
          _rightThumbPosition = right;
          _isInitialized = true;
        }

        return SizedBox(
          width: constraints.maxWidth, // 利用可能な幅全体を使用
          height: 34,
          child: Stack(
            children: [
              // トラック（バー）の背景
              Positioned(
                top: 10, // つまみの中央に合わせる
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 左側の非選択領域
                    SizedBox(
                      width: _leftThumbPosition,
                      child: const UnselectedRegionBar(),
                    ),
                    // 選択領域（つまみの間）
                    SizedBox(
                      width: _rightThumbPosition - _leftThumbPosition, // 動的な幅
                      child: const SelectedRegionBar(),
                    ),
                    // 右側の非選択領域
                    const Expanded(
                      child: UnselectedRegionBar(),
                    ),
                  ],
                ),
              ),
              // 左側のつまみ
              Positioned(
                left: _leftThumbPosition,
                top: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      final double newPosition =
                          _leftThumbPosition + details.delta.dx;
                      // 右つまみより左に、かつ最小位置より右に制限
                      if (newPosition >= _minPosition &&
                          newPosition <= _rightThumbPosition - 24) {
                        _leftThumbPosition = newPosition;
                        widget.onPositionsChanged(
                          _leftThumbPosition,
                          _rightThumbPosition,
                          _maxPosition,
                        );
                      }
                    });
                  },
                  onPanEnd: (_) {
                    final cb = widget.onPositionsChangeEnd;
                    cb(_leftThumbPosition, _rightThumbPosition, _maxPosition);
                  },
                  child: const SliderThumb(),
                ),
              ),
              // 右側のつまみ
              Positioned(
                left: _rightThumbPosition,
                top: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      final double newPosition =
                          _rightThumbPosition + details.delta.dx;
                      // 左つまみより右に、かつ最大位置より左に制限
                      if (newPosition >= _leftThumbPosition + 24 &&
                          newPosition <= _maxPosition) {
                        _rightThumbPosition = newPosition.clamp(
                          _leftThumbPosition + 24,
                          _maxPosition,
                        );
                        widget.onPositionsChanged(
                          _leftThumbPosition,
                          _rightThumbPosition,
                          _maxPosition,
                        );
                      }
                    });
                  },
                  onPanEnd: (_) {
                    // ← 追加
                    final cb = widget.onPositionsChangeEnd;
                    cb(_leftThumbPosition, _rightThumbPosition, _maxPosition);
                  },
                  child: const SliderThumb(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectionWithSlider extends StatefulWidget {
  const SelectionWithSlider({
    required this.leftIcon,
    required this.labelText,
    required this.rightIcon,
    required this.onValueTap,
    required this.min,
    required this.max,
    required this.initialMin,
    required this.initialMax,
    required this.unit,
    required this.onRangeChanged,
    super.key,
  });

  final AssetGenImage leftIcon;
  final String labelText;
  final AssetGenImage rightIcon;
  final VoidCallback onValueTap;
  final int min;
  final int max;
  final int initialMin;
  final int initialMax;
  final String unit;
  final void Function(int min, int max) onRangeChanged;

  @override
  State<SelectionWithSlider> createState() => _SelectionWithSliderState();
}

class _SelectionWithSliderState extends State<SelectionWithSlider> {
  double _leftThumbPosition = 50;
  double _rightThumbPosition = 150; // より適切な初期値に変更
  double _maxPosition = 276;
  bool _receivedLayout = false;

  double _ratioFromValue(int value) {
    if (widget.max == widget.min) return 0;
    return ((value - widget.min) / (widget.max - widget.min)).clamp(0.0, 1.0);
  }

  int _valueFromPosition(double position) {
    if (_maxPosition <= 0) return widget.min;
    final ratio = (position / _maxPosition).clamp(0.0, 1.0);
    final v = (widget.min + ratio * (widget.max - widget.min)).round();
    return v.clamp(widget.min, widget.max);
  }

  String get _valueText {
    if (!_receivedLayout) {
      return '${widget.initialMin}~${widget.initialMax}${widget.unit}';
    }
    final minValue = _valueFromPosition(_leftThumbPosition);
    final maxValue = _valueFromPosition(_rightThumbPosition);
    return '$minValue~$maxValue${widget.unit}';
  }

  void _updateSliderPositions(
    double leftPosition,
    double rightPosition,
    double maxPosition,
  ) {
    setState(() {
      _leftThumbPosition = leftPosition;
      _rightThumbPosition = rightPosition;
      _maxPosition = maxPosition;
      _receivedLayout = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double initialLeftRatio = _ratioFromValue(widget.initialMin);
    final double initialRightRatio = _ratioFromValue(widget.initialMax);

    void onSliderChangeEnd(double left, double right, double max) {
      widget.onRangeChanged(
        _valueFromPosition(left),
        _valueFromPosition(right),
      );
    }

    return Column(
      children: [
        SelectionWidget(
          leftIcon: widget.leftIcon,
          labelText: widget.labelText,
          valueText: _valueText,
          rightIcon: widget.rightIcon,
          onValueTap: widget.onValueTap,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18, left: 8),
          child: CustomSliderWithCallback(
            key: ValueKey('${widget.initialMin}-${widget.initialMax}'),
            onPositionsChanged: _updateSliderPositions,
            onPositionsChangeEnd: onSliderChangeEnd,
            initialLeftRatio: initialLeftRatio,
            initialRightRatio: initialRightRatio,
          ),
        ),
      ],
    );
  }
}

/// コールバック付き単一スライダーウィジェット
class CustomDiscreteSingleSliderWithCallback extends StatefulWidget {
  const CustomDiscreteSingleSliderWithCallback({
    required this.steps,
    required this.initialIndex,
    required this.onIndexChanged,
    super.key,
  });

  final int steps; // 段数（例: 5）
  final int initialIndex; // 初期インデックス（0..steps-1）
  final ValueChanged<int> onIndexChanged;

  @override
  State<CustomDiscreteSingleSliderWithCallback> createState() =>
      _CustomDiscreteSingleSliderWithCallbackState();
}

class _CustomDiscreteSingleSliderWithCallbackState
    extends State<CustomDiscreteSingleSliderWithCallback> {
  final double _minPosition = 0;
  double _maxPosition = 276;
  double _thumbPosition = 0;
  late int _currentIndex;
  bool _thumbInitialized = false;

  double _posForIndex(int index) {
    if (widget.steps <= 1) return 0;
    final ratio = index / (widget.steps - 1);
    return ratio * _maxPosition;
  }

  int _indexForPos(double pos) {
    if (widget.steps <= 1) return 0;
    final ratio =
        (_maxPosition <= 0) ? 0.0 : (pos / _maxPosition).clamp(0.0, 1.0);
    return (ratio * (widget.steps - 1)).round().clamp(0, widget.steps - 1);
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, widget.steps - 1);
  }

  @override
  void didUpdateWidget(
      covariant CustomDiscreteSingleSliderWithCallback oldWidget,) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      _currentIndex = widget.initialIndex.clamp(0, widget.steps - 1);
      _thumbPosition = _posForIndex(_currentIndex); // 同期的に反映
      _thumbInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _maxPosition = constraints.maxWidth - 24;
        if (!_thumbInitialized) {
          _thumbPosition = _posForIndex(_currentIndex);
          _thumbInitialized = true;
        }
        return SizedBox(
          width: constraints.maxWidth,
          height: 34,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: _thumbPosition,
                      child: const SelectedRegionBar(),
                    ),
                    const Expanded(
                      child: UnselectedRegionBar(),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: _thumbPosition,
                top: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      final newPos = (_thumbPosition + details.delta.dx)
                          .clamp(_minPosition, _maxPosition);
                      _thumbPosition = newPos;
                      final newIndex = _indexForPos(newPos);
                      if (newIndex != _currentIndex) {
                        _currentIndex = newIndex;
                        widget.onIndexChanged(_currentIndex);
                      }
                    });
                  },
                  onPanEnd: (_) {
                    setState(() {
                      _thumbPosition = _posForIndex(_currentIndex); // スナップ
                    });
                  },
                  child: const SliderThumb(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectionWithDistanceSlider extends StatefulWidget {
  const SelectionWithDistanceSlider({
    required this.leftIcon,
    required this.labelText,
    required this.rightIcon,
    required this.onValueTap,
    required this.initialCode,
    required this.onChanged,
    super.key,
  });

  final AssetGenImage leftIcon;
  final String labelText;
  final AssetGenImage rightIcon;
  final VoidCallback onValueTap;
  final DistanceLocationCode initialCode;
  final ValueChanged<DistanceLocationCode> onChanged;

  @override
  State<SelectionWithDistanceSlider> createState() =>
      _SelectionWithDistanceSliderState();
}

class _SelectionWithDistanceSliderState
    extends State<SelectionWithDistanceSlider> {
  static const _labels = ['10kmまで', '30kmまで', '50kmまで', '100kmまで', '200kmまで'];
  static const _codes = [
    DistanceLocationCode.DISTANCE_LOCATION_CODE_10_KM,
    DistanceLocationCode.DISTANCE_LOCATION_CODE_30_KM,
    DistanceLocationCode.DISTANCE_LOCATION_CODE_50_KM,
    DistanceLocationCode.DISTANCE_LOCATION_CODE_100_KM,
    DistanceLocationCode.DISTANCE_LOCATION_CODE_200_KM,
  ];

  int _index = 1; // デフォルト30km相当

  int _indexFromCode(DistanceLocationCode code) {
    final i = _codes.indexOf(code);
    return i == -1 ? 1 : i;
  }

  @override
  void initState() {
    super.initState();
    _index = _indexFromCode(widget.initialCode);
  }

  @override
  void didUpdateWidget(covariant SelectionWithDistanceSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCode != oldWidget.initialCode) {
      setState(() {
        _index = _indexFromCode(widget.initialCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final valueText = _labels[_index];

    return Column(
      children: [
        SelectionWidget(
          leftIcon: widget.leftIcon,
          labelText: widget.labelText,
          valueText: valueText,
          rightIcon: widget.rightIcon,
          onValueTap: widget.onValueTap,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18, left: 8),
          child: CustomDiscreteSingleSliderWithCallback(
            steps: _labels.length,
            initialIndex: _index,
            onIndexChanged: (i) {
              if (_index != i) {
                setState(() {
                  _index = i;
                });
                widget.onChanged(_codes[i]);
              }
            },
          ),
        ),
      ],
    );
  }
}
