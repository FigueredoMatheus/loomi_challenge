import 'package:flutter/material.dart';
import 'package:loomi_challenge/src/core/themes/app_themes.dart';

class UserSubscriptionPageviewSubscriptionBenefits extends StatelessWidget {
  const UserSubscriptionPageviewSubscriptionBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: benefits().map((benefit) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              Icon(Icons.check, color: MyThemes.get().kPurpleColor),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  benefit,
                  style: MyThemes.get().epilogueStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  List<String> benefits() {
    return [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem ipsum dolor sit amet',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      '4K+ Lorem ipsum dolor sit amet',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem ipsum dolor sit amet',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ];
  }
}
