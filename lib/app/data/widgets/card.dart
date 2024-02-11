import 'package:flutter/material.dart';
import '../core/extentions.dart';
import '../constant/colors.dart';

class CardCustom {
  static Card formBottomSheet({Key? key, required List<Widget> children}) {
    return Card(
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 0.25,
            child: Container(
              height: 5.0,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(2.5)),
              ),
              margin: const EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Form(
              key: key,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(4.0.wp, 0, 4.0.wp, 6.0.wp),
                physics: const PageScrollPhysics(),
                children: children,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
