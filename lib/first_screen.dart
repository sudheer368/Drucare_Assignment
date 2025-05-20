import 'package:flutter/material.dart';
import 'package:flutter_application_1/second.dart';
import 'package:flutter_svg/svg.dart';

class AbhaCardPage extends StatelessWidget {
  const AbhaCardPage({super.key});


  Widget buildOptionCard({
  String? svgAssetPath, // <-- updated to use SVG
  required String title,
  required String subtitle,
  bool recommended = false,
  required VoidCallback onProceed,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
      ],
      border: Border.all(color: Colors.lightBlueAccent),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (svgAssetPath != null)
          SvgPicture.asset(svgAssetPath, width: 30, height: 30),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (recommended)
                    const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        "(Recommended)",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onProceed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    child: const Text("Proceed"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

      backgroundColor: const Color(0xffeef7fc),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
  child: Row(
    mainAxisSize: MainAxisSize.min, // Important to avoid full width
    children: [
      const Text(
        "Create your ABHA Health ID",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      const SizedBox(width: 8),
      SvgPicture.asset(
        'assets/animations/Subtraction 11.svg',
        width: 24,
        height: 24,
      ),
    ],
  ),
),

                const SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 180,
                  padding: const EdgeInsets.all(0), // Remove inner padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.lightBlueAccent),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SvgPicture.asset(
                      'assets/animations/Group137241.svg',
                      fit:
                          BoxFit
                              .fill, // or BoxFit.cover or BoxFit.contain depending on SVG content
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                buildOptionCard(
  svgAssetPath: 'assets/animations/aadhar_icon-01.svg',
  title: "Using Aadhar",
  subtitle: "You get:  •  ABHA Address  •  ABHA No.",
  recommended: true,
  onProceed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Proceed with Aadhar')),
    );
  },
),
buildOptionCard(
  svgAssetPath: 'assets/animations/Phone_call_icon-01.svg',
  title: "Using Mobile Number",
  subtitle: "You get:  •  ABHA Address",
  recommended: false,
  onProceed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Proceed with Mobile Number'),
      ),
    );
  },
),


                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Link ABHA pressed')),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Already have an ABHA? "),
                        TextSpan(
                          text: "Link ABHA",
                          style: TextStyle(
                            color: Color(0xFF007BFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
  child: SizedBox(
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSvgBottomBarItem('assets/animations/Path 1403.svg', 'Home'),
        _buildSvgBottomBarItem('assets/animations/Path 1371.svg', 'Appointments'),

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

        _buildSvgBottomBarItem('assets/animations/Union 36.svg', 'Records'),
        _buildSvgBottomBarItem(
  'assets/animations/Group 137226.svg',
  'ABHA',
  isHighlighted: true,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AbhaTabbedScreen()),
    );
  },
),

      ],
    ),
  ),
)

    );
  }
}

Widget _buildSvgBottomBarItem(
  String assetPath,
  String label, {
  bool isHighlighted = false,
  VoidCallback? onTap,
}) {
  return GestureDetector( // <-- Add this to detect taps
    onTap: onTap,
    child: Column(
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
    ),
  );
}
