import 'package:aqar/core/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/aqar_colors.dart';
import '../../../core/constants/aqar_string.dart';
import '../../../core/constants/constants.dart';
import '../../../gen/assets.gen.dart';
import 'widget/contact_details_widget.dart';
import 'widget/contact_us_header.dart';
import 'widget/custom_app_bar_leading_widget.dart';
import 'widget/facebook_url_widget.dart';
import 'widget/website_url_widget.dart';
import 'widget/whatsapp_url_widget.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Widget> _items = [];

  @override
  void initState() {
    super.initState();
    _addItemsWithDelay();
  }

  void _addItemsWithDelay() async {
    final widgets = [
      ContactDetailsWidget(
        title: AqarString.chatWithUs,
        subTitle: AqarString.chatWithOurAssistantNow,
        icon: Assets.icons.support,
        color: AqarColors.lightBlue,
        onTap: () => Constants.openTelegramBot(),
      ),
      ContactDetailsWidget(
        title: AqarString.callUs,
        subTitle: AqarString.weAreAvailableFromTwelveToTwelve,
        icon: Assets.icons.call,
        color: AqarColors.amber,
        onTap: () => Constants.makePhoneCall(),
      ),
      ContactDetailsWidget(
        title: AqarString.emailUs,
        subTitle: AqarString.weWillGetBackWithin,
        icon: Assets.icons.chat,
        color: AqarColors.pink,
        onTap: () => Constants.sendEmail(),
      ),
      Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 7, horizontal: 14),
        child: SectionHeading(
            text: AqarString.ourSocialMedia, isActionButton: false),
      ),
      FacebookUrlWidget(),
      WhatsappUrlWidget(),
      WebsiteUrlWidget(),
    ];

    for (int i = 0; i < widgets.length; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      _items.add(widgets[i]);
      _listKey.currentState?.insertItem(_items.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AqarColors.blue,
        leading: CustomAppBarLeadingWidget(),
        elevation: 0,
      ),
      body: Column(
        spacing: 10,
        children: [
          ContactUsHeader(),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _items.length,
              itemBuilder: (context, index, animation) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeOut)),
                  ),
                  child: _items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
