import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  final String jobTitle;
  final String description;
  final String location;
  final String requester;
  final String rating;

  const JobDetailsPage({
    super.key,
    required this.jobTitle,
    required this.description,
    required this.location,
    required this.requester,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Request")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 360, color: Colors.grey.shade300, child: const Center(child: Icon(Icons.map, size: 50))),
            const SizedBox(height: 4),
       Container(
  height: 200,
  width: double.infinity,
  decoration: BoxDecoration(
    border: Border.all(width: 1.5, color: Colors.white),
    borderRadius: BorderRadius.circular(30),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(30), // Same as container
    child: Image.asset(
      'assets/images/ac man.jpg',
      fit: BoxFit.cover,
    ),
  ),
       ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jobTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
                  const SizedBox(height: 8),
                  Text(description),
                  const SizedBox(height: 16),
                  const Text("LOCATION", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(location),
                  const SizedBox(height: 16),
                  const Text("REQUESTED BY", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text(requester),
                      const SizedBox(width: 8),
                      const Icon(Icons.star, color: Colors.teal, size: 16),
                      Text(rating),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.teal, width: 1.5),
                            foregroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text("Track"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.teal, width: 1.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: const Icon(Icons.phone, color: Colors.teal),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.teal, width: 1.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: const Icon(Icons.message, color: Colors.teal),
                      ),
                    ],
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