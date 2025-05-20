import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AbhaTabbedScreen extends StatefulWidget {
  const AbhaTabbedScreen({super.key});

  @override
  State<AbhaTabbedScreen> createState() => _AbhaTabbedScreenState();
}

class _AbhaTabbedScreenState extends State<AbhaTabbedScreen> {
  int selectedIndex = 0;
  final List<String> tabs = ['ABHA', 'Consents', 'Providers'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Icon(Icons.menu, color: Colors.black),
              const SizedBox(width: 12),
              const Text(
                'ABHA',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/animations/qr133965.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 20),
              Stack(
                children: [
                  const Icon(Icons.notifications_none, color: Colors.black),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          // Top Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: List.generate(tabs.length, (index) {
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() => selectedIndex = index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == index ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(index == 0 ? 10 : 0),
                          bottomLeft: Radius.circular(index == 0 ? 10 : 0),
                          topRight: Radius.circular(
                            index == tabs.length - 1 ? 10 : 0,
                          ),
                          bottomRight: Radius.circular(
                            index == tabs.length - 1 ? 10 : 0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color:
                                selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 20),

          // Content based on selected tab
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                abhaTabContent(),
                const Center(child: Text('Consents screen')),
                const Center(child: Text('Providers screen')),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar with FAB
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSvgBottomBarItem('assets/animations/Path 1403.svg', 'Home'),
              _buildSvgBottomBarItem(
                'assets/animations/Path 1371.svg',
                'Appointments',
              ),

              // Center SVG FAB-style button
              GestureDetector(
                onTap: () {
                  // Handle FAB-like action
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    'assets/animations/plus-addition-sign-circle.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  ),
                ),
              ),

              _buildSvgBottomBarItem(
                'assets/animations/Union 36.svg',
                'Records',
              ),
              _buildSvgBottomBarItem(
                'assets/animations/Group 137226.svg',
                'ABHA',
                isHighlighted: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSvgBottomBarItem(
    String assetPath,
    String label, {
    bool isHighlighted = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
          color: isHighlighted ? Colors.blue : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isHighlighted ? Colors.blue : Colors.grey,
            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget abhaTabContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // ABHA CARD
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xFF005DA6),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          color: Colors.white,
                          width: 40,
                          height: 40,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: SvgPicture.asset(
                              'assets/animations/Group 133981.svg',
                            ),
                          ),
                        ),
                      ),

                      Spacer(),
                      SvgPicture.asset(
                        'assets/animations/National Health Authority.svg', // Replace with your actual SVG asset path
                        height: 40, // Adjust as needed
                        color:
                            Colors
                                .white, // Optional: apply color if your SVG supports it
                      ),
                    ],
                  ),
                ),

                // Details
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Mr. Anirudh Karunakaran (35 yrs)',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("ABHA Num.: 12-5432-6783-9080"),
                            Text("ABHA @: praneethkraju98@abdm"),
                            Text("Date of Birth: 11/06/1998"),
                            Text("Gender: Male"),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/animations/MicrosoftTeams-image (39)@2x.png', // Replace with your PNG path
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain, // Optional: adjust as needed
                      ),
                    ],
                  ),
                ),

                // View Button
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFF00AEEF),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: const [
                      SizedBox(width: 10),
                      Text(
                        "View ABHA Card",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Action Buttons
          Column(
            children: const [
              ActionTile(
                icon: Icons.qr_code_scanner,
                text: "Get Appointment Token",
              ),
              SizedBox(height: 16),
              ActionTile(
                icon: Icons.medical_services_outlined,
                text: "Add Medical Records",
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const ActionTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Action on tap
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: Colors.lightBlue, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
