/// RevenueCat Offering ID 定義（マジック文字列の集約）
enum RevenueCatOfferingId {
  lpPackages('lp_packages'),
  mpPackages('mp_packages');

  const RevenueCatOfferingId(this.id);
  final String id;
}


