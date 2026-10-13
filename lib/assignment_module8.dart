import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0878E8)),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color primaryBlue = Color(0xFF0878E8);
  static const Color textColor = Color(0xFF34404D);
  static const Color mutedColor = Color(0xFF788391);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 12),
              child: Column(
                children: [
                  // Profile section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: Column(
                      children: [
                        // Profile image
                        const CircleAvatar(
                          radius: 43,
                          backgroundColor: Color(0xFFE0E6EB),
                          backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9c_qIKaMQ8QeRrIzukdRAOsLR-WWJTQNWlnZrfOOWpw&s=10',
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Name
                        const Text(
                          'Jahir Ahmed',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),

                        const SizedBox(height: 2),

                        // Subtitle
                        const Text(
                          'Flutter Developer',
                          style: TextStyle(fontSize: 11, color: mutedColor),
                        ),

                        const SizedBox(height: 10),

                        // Bio
                        const Text(
                          'Passionate about creating user-friendly '
                          'and engaging digital experiences.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            height: 1.4,
                            color: Color(0xFF626D79),
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Divider(height: 1, color: Color(0xFFF0F0F0)),

                        const SizedBox(height: 8),

                        // Contact information
                        const Row(
                          children: [
                            Icon(Icons.email, size: 13, color: textColor),
                            SizedBox(width: 6),
                            Text(
                              'jahir.ahmed@example.com',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF596471),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        const Row(
                          children: [
                            Icon(Icons.phone, size: 13, color: textColor),
                            SizedBox(width: 6),
                            Text(
                              '+880-171-234-5678',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF596471),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 9),

                        // Follow and Message buttons
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 34,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Follow button clicked'),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryBlue,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text(
                                    'Follow',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 34,
                                child: OutlinedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Message button pressed!',
                                        ),
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: textColor,
                                    side: const BorderSide(
                                      color: Color(0xFFD8DDE2),
                                    ),
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text(
                                    'Message',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Interests heading with divider lines
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xFFDADDE1))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Interests',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Color(0xFFDADDE1))),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Two interest cards
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InterestCard(
                          imageUrl:
                              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e'
                              '?auto=format&fit=crop&w=600&q=80',
                          title: 'Travel',
                          description: 'Exploring new places around the world',
                          onViewMore: () {
                            showInterestMessage(context, 'Travel');
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InterestCard(
                          imageUrl:
                              'https://cdn.mos.cms.futurecdn.net/GXHa4PWwDPx7tGQG9MDQvK.jpg',
                          title: 'Photography',
                          description: 'Capturing moments through the lens',
                          onViewMore: () {
                            showInterestMessage(context, 'Photography');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static void showInterestMessage(BuildContext context, String interest) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$interest: View More selected')));
  }
}

// Reusable interest card widget
class InterestCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onViewMore;

  const InterestCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onViewMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color(0xFFE5E7EA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Interest image
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;

                return Container(
                  height: 100,
                  color: const Color(0xFFE9EDF1),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  width: double.infinity,
                  color: const Color(0xFFE9EDF1),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 6),

          // Card title
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF34404D),
            ),
          ),

          const SizedBox(height: 4),

          // Card description
          SizedBox(
            height: 24,
            child: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 8,
                height: 1.4,
                color: Color(0xFF788391),
              ),
            ),
          ),

          const SizedBox(height: 5),

          // View More button
          SizedBox(
            width: double.infinity,
            height: 30,
            child: ElevatedButton(
              onPressed: onViewMore,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF1F3F5),
                foregroundColor: const Color(0xFF0878E8),
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'View More',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
