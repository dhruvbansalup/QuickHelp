import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_help/common/styles/spacing_styles.dart';
import 'package:quick_help/features/service_provider.features/home/controllers/list_service_requests.controller.dart';
import 'package:quick_help/features/service_provider.features/home/screens/JobDetails.dart';
import 'package:quick_help/features/service_provider.features/home/screens/requests_list.dart';
import 'package:quick_help/features/service_provider.features/drawer/drawer_serviceProvider.dart';
import 'package:quick_help/features/notifications/screens/notifications.dart';
import 'package:quick_help/utils/constants/appcolors.dart';
import 'package:quick_help/utils/helpers/helper_functions.dart';
class ServiceProviderHome extends StatelessWidget {
  const ServiceProviderHome({super.key});

  @override
  Widget build(BuildContext context) {
     final isDark = QHelperFunctions.isDarkMode(context);

    final ListServiceController=Get.put(ListServiceRequestsController());


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: QSpacingStyles.paddingWithAppBar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Location and Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                      Icon(Icons.location_on, color: isDark ? QAppColors.darkText : QAppColors.lightText, size: 30),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Service Location',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16,
                                color: isDark ? QAppColors.darkText : QAppColors.lightText,),
                          ),
                          Text(
                            'Pocket 11 sector 22 , Rohini',
                            style: TextStyle(fontSize: 14,
                              color: isDark ? QAppColors.darkText.withOpacity(0.7) : QAppColors.lightText.withOpacity(0.7),
                              ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                                        children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ServiceProviderNotiPage()),
                          );
                        },
                        child:  Icon(Icons.notifications_none,color: isDark ? QAppColors.darkText : QAppColors.lightText),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileServiceProviderPage()),
                          );
                        },
                        child:  Icon(Icons.person_outline,color: isDark ? QAppColors.darkText : QAppColors.lightText),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Earnings card
              Container(
    
               decoration: BoxDecoration(
                    border: Border.all(color: QAppColors.shade2, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text("Earned today"),
                    const SizedBox(height: 8),
                    const Text("₹ 480", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Column(
                          children: [
                            Text("Total Works"),
                            Text("12", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Working time"),
                            Text("6 hrs 15 mins", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("This month"),
                            Text("₹ 18900", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: QAppColors.shade2, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Ongoing Work", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailsPage(
                              jobTitle: "AC indoor cleaning",
                              description: "Indoor AC unit cleaning and maintenance.",
                              location: "Near Rohini sector 21",
                              requester: "Shyam Singh",
                              rating: "4.7",
                            ),
                          ),
                        );
                      },
                      child: OngoingWorkCard(
                        name: "Shyam Singh",
                        rating: "4.7",
                        time: "3.50 pm",
                        date: "12-05-2025",
                        isDark: isDark,
                        workType: "AC indoor cleaning",
                        location: "Near Rohini sector 21",
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailsPage(
                              jobTitle: "Fan repair",
                              description: "Ceiling fan not working, needs repair.",
                              location: "Near India Gate ",
                              requester: "Suraj yadav",
                              rating: "4.9",
                            ),
                          ),
                        );
                      },
                      child: OngoingWorkCard(
                        name: "Suraj yadav",
                        rating: "4.9",
                        time: "1.15 pm",
                        date: "12-05-2025",
                        isDark: isDark,
                        workType: "Fan repair",
                        location: "Near India Gate ",
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailsPage(
                              jobTitle: "Fridge maintenance",
                              description: "Fridge cooling issue, requires maintenance.",
                              location: "Pocket 11, Rohini",
                              requester: "Mohan lal",
                              rating: "4.2",
                            ),
                          ),
                        );
                      },
                      child: OngoingWorkCard(
                        name: "Mohan lal",
                        rating: "4.2",
                        time: "7.20 pm",
                        date: "12-05-2025",
                        isDark: isDark,
                        workType: "Fridge maintenance",
                        location: "Pocket 11, Rohini",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Bottom Requests
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ListServiceController.requestStatus.value='new';

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CompleteRequestPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                     decoration: BoxDecoration(
                      border: Border.all(color: QAppColors.shade2, width: 1.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("New Requests", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            Text("7 new requests", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {

                        ListServiceController.requestStatus.value='completed';

                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CompleteRequestPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: QAppColors.shade2, width: 1.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Completed Orders", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            Text("17 orders completed", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class OngoingWorkCard extends StatelessWidget {
  final String name;
  final String rating;
  final String time;
  final String date;
  final bool isDark;
  final String workType;
  final String location;

  const OngoingWorkCard({
    super.key,
    required this.name,
    required this.rating,
    required this.time,
    required this.date,
    required this.isDark,
    required this.workType,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: QAppColors.shade1, width: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person_outline, color: isDark ? QAppColors.darkText : QAppColors.text),
                  const SizedBox(width: 8),
                  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? QAppColors.darkText : QAppColors.text)),
                  const SizedBox(width: 15),
                  Icon(Icons.star, color: isDark ? QAppColors.darkText : QAppColors.text),
                  Text(rating, style: TextStyle(fontSize: 14, color: isDark ? QAppColors.darkText : QAppColors.text)),
                ],
              ),
              const SizedBox(height: 4),
              Text(workType, style: TextStyle(fontSize: 14, color: isDark ? QAppColors.darkText : QAppColors.text)),
              Text(location, style: TextStyle(fontSize: 14, color: isDark ? QAppColors.darkText.withOpacity(0.7) : QAppColors.text.withOpacity(0.7))),
            ],
          ),
          Column(
            children: [
              Text(time),
              Text(date),
            ],
          ),
        ],
      ),
    );
  }
}
