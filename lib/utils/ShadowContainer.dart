import 'package:flutter/material.dart';

class AppShadow {
  shadowSetting() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 0), // Shadow position
        ),
      ],
    );
  }

  shadowSettingQuestionaire() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 0), // Shadow position
        ),
      ],
    );
  }
}
