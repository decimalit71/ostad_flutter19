import 'package:flutter/material.dart';

void main() {
  runApp(const BloodRequestApp());
}

class BloodRequestApp extends StatelessWidget {
  const BloodRequestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Requests',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        fontFamily: 'Roboto',
      ),
      home: const BloodRequestsPage(),
    );
  }
}

class BloodRequestsPage extends StatelessWidget {
  const BloodRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Blood Requests',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
        children: const [
          BloodRequestCard(
            bloodGroup: 'O-',
            units: 3,
            location:
            'Khulna City Medical College Hospital, KDA Ave...',
            buttonColor: Colors.blue,
          ),
          SizedBox(height: 30),
          BloodRequestCard(
            bloodGroup: 'O+',
            units: 2,
            location:
            'Khulna City Medical College Hospital, KDA Ave...',
            buttonColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  final String bloodGroup;
  final int units;
  final String location;
  final Color buttonColor;

  const BloodRequestCard({
    super.key,
    required this.bloodGroup,
    required this.units,
    required this.location,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    const redColor = Colors.red;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Red urgency indicator
            Container(
              width: 6,
              decoration: const BoxDecoration(
                color: redColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  bottomLeft: Radius.circular(22),
                ),
              ),
            ),

            // Card content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 24, 18, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Urgency label and blood units
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEEEE),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'URGENT',
                            style: TextStyle(
                              color: redColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.water_drop,
                              color: redColor,
                              size: 23,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$units Units',
                              style: const TextStyle(
                                color: Color(0xFF171717),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Blood group title
                    Text(
                      '$bloodGroup Blood Needed',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF171717),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Hospital location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 22,
                          color: Color(0xFF858585),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // View Details button
                    SizedBox(
                      width: double.infinity,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: () { },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
