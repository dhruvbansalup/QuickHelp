import 'package:flutter/material.dart';
import 'package:quick_help/common/styles/spacing_styles.dart';
import 'package:quick_help/features/consumer.features/home/screens/home.consumer.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';

class SearchPage extends StatelessWidget {
  final List<String> popularSearches = [
    "Indoor Cleaning",
    "Plumbing Drain Repair",
    "Electrician",
    "Interior Painting",
    "Packing and unpacking",
    "Cooler repair",
    "AC serice"
  ];

  final List<Map<String, String>> topServices = [
    {"label": "Plumber", "icon": "assets/images/plumber.jpg"},
    {"label": "AC repair", "icon": "assets/images/ac man.jpg"},
    {"label": "Carpentary", "icon": "assets/images/carpenter.jpg"},
    {"label": "Painting", "icon": "assets/images/painter.jpg"},
    {"label": "Laundry", "icon": "assets/images/laundry.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = QHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: QSpacingStyles.paddingWithAppBar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ConsumerHome();
                          },
                        ),
                      );
                    },
                    child: Icon(Icons.arrow_back, size: 24),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.teal.shade700, width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: isDark ? QAppColors.darkText : QAppColors.lightText),
                          const SizedBox(width: 8),
                        Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for Services',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(color: isDark ? QAppColors.darkText : QAppColors.lightText),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text(
                'Popular Searches',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Popular search chips
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: popularSearches
                    .map((text) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.teal),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(text),
                              const SizedBox(width: 5),
                              const Icon(Icons.arrow_outward, size: 16),
                            ],
                          ),
                        ))
                    .toList(),
              ),

              const SizedBox(height: 20),
              Text(
                'Top services on QuickHelp',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Horizontal scroll of top services
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topServices.length,
                  itemBuilder: (context, index) {
                    final service = topServices[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.lightBlue.shade50,
                            backgroundImage: AssetImage(service["icon"]!),
                           // child: Icon(Icons.image, size: 30, color: Colors.grey),
                            // To use actual icons: backgroundImage: AssetImage(service["icon"]!),
                          ),
                          const SizedBox(height: 6),
                          Text(service["label"]!),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}