import 'package:alpha_twelve/src/shared/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';

void showTopSnackbar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 20,
      left: 0,
      right: 0,
      child: TopSnackbar(
        message: message,
        onClose: () {
          overlayEntry.remove();
        },
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3)).then((_) {
    if (overlayEntry.mounted) overlayEntry.remove();
  });
}
