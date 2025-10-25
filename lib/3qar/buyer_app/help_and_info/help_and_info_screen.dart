import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HelpAndInfoScreen extends StatefulWidget {
  const HelpAndInfoScreen({super.key});

  @override
  State<HelpAndInfoScreen> createState() => _HelpAndInfoScreenState();
}

class _HelpAndInfoScreenState extends State<HelpAndInfoScreen> {
  int? expandedIndex;

  final List<Map<String, String>> faqItems = [
    {
      'number': '01',
      "question": "How do I use the 3qar app?",
      "answer":
          "After downloading the app, you can create a new account and choose your role (Seller, Buyer, or Agent). Then, you can browse properties, use filters to refine searches, or post a new property ad."
    },
    {
      'number': '02',
      "question": "Is the app free?",
      "answer":
          "Yes, basic features are completely free. However, there are premium features such as highlighting your ad in search results, increasing your monthly ad limit, and promoting your listings on social media."
    },
    {
      'number': '03',
      "question": "How can I add a new property?",
      "answer":
          "Open the Home screen and tap 'Add Property'. Fill in property details (address, price, area, number of rooms, etc.). Upload property images or videos, choose the type (For Sale / For Rent), and tap 'Publish Property'."
    },
    {
      'number': '04',
      "question": "How do I find a property?",
      "answer":
          "Use the Advanced Search feature to filter by city and neighborhood, price range, number of rooms or bathrooms, property type (Apartment, Villa, Land...), and condition (New, Used, Under Construction)."
    },
    {
      'number': '05',
      "question": "Can I save favorite properties?",
      "answer":
          "Yes, tap the ❤️ icon to save a property to your favorites list for quick access later."
    },
    {
      'number': '06',
      "question": "How can I contact the property owner?",
      "answer":
          "Open the property's page and tap 'Contact Owner'. You can then call directly, send an in-app message, or chat through our Telegram bot."
    },
    {
      'number': '07',
      "question": "Can I edit or delete my listing?",
      "answer":
          "Yes, go to the 'My Listings' page. You can edit any property details or delete the listing anytime."
    },
    {
      'number': '08',
      "question": "What services does 3qar offer?",
      "answer":
          "We offer Free Accounts (up to 3 listings/month), Premium Plans (highlighted listings & visibility), Business Plans (unlimited listings + dashboard), and Marketing Campaigns for social media promotion."
    },
    {
      'number': '09',
      "question": "What are the accepted payment methods?",
      "answer":
          "Visa / MasterCard, local e-wallets (Vodafone Cash, Etisalat Cash, etc.), and bank transfer for business accounts."
    },
    {
      'number': '10',
      "question": "The app isn't opening or keeps crashing — what should I do?",
      "answer":
          "Check your internet connection, close and reopen the app, or clear the app cache. If the issue continues, update to the latest version or contact us via @aqar3_bot."
    },
    {
      'number': '11',
      "question": "I'm having login issues. What should I do?",
      "answer":
          "Ensure you're using the correct email or phone number. If you forgot your password, use the 'Forgot Password?' feature to reset it."
    },
    {
      'number': '12',
      "question": "Why can't I upload images?",
      "answer":
          "Make sure each image is under 5 MB and that the app has permission to access your files."
    },
    {
      'number': '13',
      "question": "Notifications aren't working — how can I fix this?",
      "answer":
          "Check your phone's settings to ensure notifications are enabled for 3qar, and also verify that notifications are turned on inside the app."
    },
    {
      'number': '14',
      "question": "Who are the main user roles in 3qar?",
      "answer":
          "Owner: Lists their own properties. Buyer: Searches and compares properties. Agent: Manages multiple listings for different owners."
    },
    {
      'number': '15',
      "question": "How should support staff handle a customer complaint?",
      "answer":
          "Listen carefully and stay polite. Confirm the details of the issue, forward technical cases to the dev team, and update the customer with the resolution timeline."
    },
    {
      'number': '16',
      "question": "What are the key features of the 3qar app?",
      "answer":
          "Smart search by keywords and location, filters by price/city/type, verified listings for trust, and instant support via Telegram bot or email."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
        leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Iconsax.arrow_left_2_copy)),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            child: ExpansionTile(
              enableFeedback: false,
              key: Key(index.toString()),
              onExpansionChanged: (expanded) {
                setState(() {
                  expandedIndex = expanded ? index : null;
                });
              },
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              childrenPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              shape: const Border(),
              collapsedShape: const Border(),
              clipBehavior: Clip.antiAlias,
              expansionAnimationStyle: AnimationStyle(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              ),
              iconColor: AqarColors.green,
              collapsedIconColor: AqarColors.green,
              title: Row(
                spacing: AqarHelperFunctions.screenWidth(context) * .03,
                children: [
                  Text(faqItems[index]['number']!,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: AqarColors.green)),
                  Expanded(
                    child: Text(faqItems[index]['question']!),
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    faqItems[index]['answer']!,
                  ),
                ),
              ],
            ),
          ),
          itemCount: faqItems.length,
        ),
      ),
    );
  }
}
