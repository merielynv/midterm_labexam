import 'package:flutter/material.dart';

// ITP107 - Mobile Application Development
// Midterm Laboratory Examination - Set A
// Student: Navea, Merielyn B. | Professor: Mr. Albert Alforja
//
// Widgets used (7+ different kinds, as required by the exam):
// 1. Text            2. Image            3. Container
// 4. Card             5. ElevatedButton   6. GestureDetector
// 7. Wrap             8. Icon             9. Row / Column (layout)

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.cream,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

/// Color palette exactly as specified on the design reference.
class AppColors {
  static const Color darkBrown = Color(0xFF5B3A1E);
  static const Color autumnOrange = Color(0xFFD3541F);
  static const Color pumpkin = Color(0xFFE67E22);
  static const Color lightOrange = Color(0xFFF4A261);
  static const Color cream = Color(0xFFF7E7CE);
  static const Color beige = Color(0xFFE9D8B7);
  static const Color sageGreen = Color(0xFFA3B18A);
  static const Color charcoal = Color(0xFF4A4A4A);
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  // Exam-specific data (from the Laboratory Examination form).
  static const String studentFullName = 'Merielyn B. Navea';
  static const String professorFullName = 'Mr. Albert Alforja';

  // Message shown in the on-screen "debug console" panel, mirroring
  // whatever was last printed to the real Debug Console.
  String _consoleOutput =
      'Outputs will appear here after a gesture. Check dev tools console for gesture output history.';

  String _formattedExamDate() {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final now = DateTime.now();
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }

  void _onSingleTap() {
    final output = 'Exam Date: ${_formattedExamDate()}';
    // Requirement: Single Tap -> print current date of the examination.
    debugPrint('[SINGLE TAP] $output');
    setState(() => _consoleOutput = '[SINGLE TAP] $output');
  }

  void _onDoubleTap() {
    final output = 'Professor: $professorFullName';
    // Requirement: Double Tap -> print full name of the ITP107 professor.
    debugPrint('[DOUBLE TAP] $output');
    setState(() => _consoleOutput = '[DOUBLE TAP] $output');
  }

  void _onLongPress() {
    final output = 'Student: $studentFullName';
    // Requirement: Long Press -> print the student's full name.
    debugPrint('[LONG PRESS] $output');
    setState(() => _consoleOutput = '[LONG PRESS] $output');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ProfileCard(
                onSingleTap: _onSingleTap,
                onDoubleTap: _onDoubleTap,
                onLongPress: _onLongPress,
                consoleOutput: _consoleOutput,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Top profile section: header bar, avatar photo, name/title/location,
/// stat chips, About Me, Interests, and the gesture-driven "Click Me" button.
class _ProfileCard extends StatelessWidget {
  final VoidCallback onSingleTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onLongPress;
  final String consoleOutput;

  const _ProfileCard({
    required this.onSingleTap,
    required this.onDoubleTap,
    required this.onLongPress,
    required this.consoleOutput,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.cream,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: AppColors.beige, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header row: menu icon + notification bell ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.cream,
                  child: const Icon(
                    Icons.home_outlined,
                    color: AppColors.pumpkin,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'PERSONAL PORTFOLIO',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: AppColors.darkBrown,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.cream,
                  child: Icon(
                    Icons.notifications_none,
                    color: AppColors.pumpkin,
                  ),
                ),
              ],
            ),
            Divider(color: AppColors.beige, thickness: 1),
            const SizedBox(height: 10),

            // --- Avatar photo + name/title/location ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(
                    1,
                  ), // gap between border and photo
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.autumnOrange, // outline color
                      width: 2.5, // outline thickness
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/pfp.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 100,
                        height: 100,
                        color: AppColors.beige,
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: AppColors.darkBrown,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Merielyn B. Navea',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBrown,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'College Student',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.autumnOrange,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: AppColors.charcoal,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Cabuyao, Laguna, Philippines',
                            style: TextStyle(color: AppColors.charcoal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // --- Stat chips row ---
            Row(
              children: [
                _StatChip(
                  icon: Icons.school,
                  label: 'BSIT',
                  sub: 'Course/Program',
                ),
                const SizedBox(width: 10),
                _StatChip(
                  icon: Icons.bar_chart,
                  label: '3rd Year',
                  sub: 'Year Level',
                ),
                const SizedBox(width: 10),
                _StatChip(
                  icon: Icons.workspace_premium,
                  label: '15',
                  sub: 'Certifications',
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- About Me ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.beige.withOpacity(0.4),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.beige),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline, color: AppColors.autumnOrange),
                      const SizedBox(width: 8),
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.darkBrown,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mobile application development student building a '
                    'Flutter portfolio app for the ITP107 midterm laboratory '
                    'examination, focused on clean layout and gesture-driven '
                    'interactivity.',
                    style: TextStyle(color: AppColors.charcoal, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // --- Interests (all shown at once, wrapped across rows) ---
            Row(
              children: [
                Icon(Icons.favorite, color: AppColors.autumnOrange, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Interests',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBrown,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _InterestChip(icon: Icons.palette, label: 'Design'),
                _InterestChip(icon: Icons.code, label: 'Coding'),
                _InterestChip(icon: Icons.brush, label: 'UI/UX'),
                _InterestChip(icon: Icons.public, label: 'Web Development'),
                _InterestChip(icon: Icons.smartphone, label: 'App Development'),
                _InterestChip(icon: Icons.play_circle_fill, label: 'Watching'),
                _InterestChip(icon: Icons.gamepad_sharp, label: 'Gaming'),
                _InterestChip(icon: Icons.star, label: 'Anime'),
              ],
            ),
            const SizedBox(height: 20),

            // --- GestureDetector-driven "Click Me" button ---
            GestureDetector(
              onTap: onSingleTap,
              onDoubleTap: onDoubleTap,
              onLongPress: onLongPress,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.autumnOrange,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    const Text(
                      'LAB EXAM GESTURE ACTION',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Icon(Icons.touch_app, color: Colors.white, size: 28),
                    const Text(
                      'Click Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Tap, Double Tap, or Long Press!',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // --- On-screen echo of the Debug Console output ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.charcoal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.terminal,
                    color: Colors.greenAccent,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      consoleOutput,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
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

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sub;

  const _StatChip({required this.icon, required this.label, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.beige),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.autumnOrange, size: 20),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkBrown,
              ),
            ),
            Text(
              sub,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: AppColors.charcoal),
            ),
          ],
        ),
      ),
    );
  }
}

class _InterestChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InterestChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.beige.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.darkBrown),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: AppColors.darkBrown)),
        ],
      ),
    );
  }
}
