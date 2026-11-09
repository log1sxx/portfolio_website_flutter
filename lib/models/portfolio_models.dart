import 'package:flutter/material.dart';

class ProjectData {
  const ProjectData({
    required this.name,
    required this.category,
    required this.description,
    required this.metric,
    required this.background,
    required this.accent,
    required this.url,
    required this.icon,
  });
  final String name, category, description, metric, url;
  final Color background, accent;
  final IconData icon;
}

class SkillData {
  const SkillData(this.title, this.description, this.icon);
  final String title, description;
  final IconData icon;
}

class JobData {
  const JobData(
    this.period,
    this.role,
    this.company,
    this.description,
    this.tags,
  );
  final String period, role, company, description;
  final List<String> tags;
}
