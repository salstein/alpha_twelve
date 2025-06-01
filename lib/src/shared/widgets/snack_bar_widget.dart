import 'package:flutter/material.dart';

class TopSnackbar extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const TopSnackbar({
    super.key,
    required this.message,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onClose,
                  child: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
