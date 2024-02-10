import 'package:flutter/material.dart';
import '../constant/colors.dart';

class CardCustom {
  static Card cardOption(
      {required String title,
      required String teks,
      void Function()? onTap,
      bool selected = false}) {
    return Card(
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      elevation: 3,
      child: ListTile(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        selectedTileColor: Colors.blueGrey,
        selected: selected,
        style: ListTileStyle.drawer,
        onTap: onTap,
        title: Text(title),
        subtitle: null,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            teks,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  static Card cardQuiz({
    required int index,
    required String title,
    String? subtitle,
    void Function()? onTap,
  }) {
    return Card(
      surfaceTintColor: Colors.transparent,
      color: Colors.blue.shade100,
      elevation: 3,
      child: ListTile(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        style: ListTileStyle.drawer,
        onTap: onTap,
        title: Text(title,
            style: TextStyle(
                color: AppColors.biruTua, fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            '${index + 1}'.toString(),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
