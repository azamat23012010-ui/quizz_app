import 'package:flutter/material.dart';

class SettingsItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;
  final String? email;
  final bool isMode;
  final bool isDARK;
  final bool isAbout;
  final String? version;
  SettingsItem({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isActive,
    this.email,
    required this.isMode,
    required this.isDARK, required this.isAbout,this.version,
    
  });
}

class SettingsSection {
  final String title;
  final List<SettingsItem> items;
  SettingsSection({required this.title, required this.items});
}
