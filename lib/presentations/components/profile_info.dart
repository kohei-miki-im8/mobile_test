import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/presentations/components/login_status.dart';
import 'package:econa_mobile_app/presentations/components/name_age_city.dart';
import 'package:econa_mobile_app/presentations/components/verified_badge.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    required this.profile,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.all(24),
    this.verifiedBadgeBackgroundColor,
    this.isVisibleLoginStatus = true,
    super.key,
  });

  final Profile profile;
  final Color textColor;
  final EdgeInsets padding;
  final Color? verifiedBadgeBackgroundColor;
  final bool isVisibleLoginStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isVisibleLoginStatus)...[
            LoginStatusWidget(
              loginStatus: profile.loginStatus,
              textColor: textColor,
            ),
            const SizedBox(height: 16),
          ],
          NameAgeCity(
            name: profile.name,
            ageText: profile.ageText,
            cityText: profile.cityText,
            textColor: textColor,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              for (int i = 0; i < profile.verifiedBadges.length; i++) ...[
                VerifiedBadge(
                  text: profile.verifiedBadges[i],
                  textColor: textColor,
                  backgroundColor: verifiedBadgeBackgroundColor,
                ),
                if (i != profile.verifiedBadges.length - 1)
                  const SizedBox(width: 16),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
