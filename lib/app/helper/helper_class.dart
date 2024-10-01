import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelperFunctions {
  // Show Confirmation Bottom Sheet
  static void showConfirmationBottomSheet(
    BuildContext context, {
    required VoidCallback onPressed1,
    required VoidCallback onPressed2,
    IconData? icon1,
    IconData? icon2,
    required String title1,
    required String title2,
    required String message,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // No border radius
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Color(0xFF1F1B46),
                  thickness: 4.0,
                  endIndent: 320.0,
                  height: 20.0,
                ),
                Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: onPressed1,
                  icon: Icon(
                    icon1,
                    color: Colors.green.withOpacity(0.8),
                  ),
                  label: Text(
                    title1,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: onPressed2,
                  icon: Icon(
                    icon2,
                    color: Colors.red.withOpacity(0.8),
                  ),
                  label: Text(
                    title2,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
