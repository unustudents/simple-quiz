import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';

class DialogCustom {
  static errorDialog(
      {required String msg, void Function()? onPres, String? teks}) {
    return _generalDialog(
        msg: msg, clr: AppColors.error, onPressed: onPres, teks: teks);
  }

  static warningDialog(
      {required String msg, void Function()? onPres, String? teks}) {
    return _generalDialog(
        img: 'assets/images/confirm.png',
        msg: msg,
        clr: AppColors.warning,
        onPressed: onPres,
        teks: teks);
  }

  static Future<dynamic> _generalDialog({
    String img = 'assets/images/info.png',
    required String msg,
    required Color clr,
    void Function()? onPressed,
    String? teks,
  }) {
    return Get.generalDialog(
      transitionDuration: Durations.medium2,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // // bottom
        // return SlideTransition(
        //   position: Tween<Offset>(
        //     end: Offset.zero,
        //     begin: const Offset(0.0, 1.0),
        //   ).animate(animation),
        //   child: child,
        // );

        // // grow
        // return ScaleTransition(
        //   scale: Tween<double>(end: 1.0, begin: 0.0).animate(
        //     CurvedAnimation(
        //       parent: animation,
        //       curve: const Interval(
        //         0.00,
        //         0.50,
        //         curve: Curves.linear,
        //       ),
        //     ),
        //   ),
        //   child: child,
        // );

        // shrink
        return ScaleTransition(
          scale: Tween<double>(end: 1.0, begin: 1.2).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.50,
                1.00,
                curve: Curves.linear,
              ),
            ),
          ),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 340),
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(img, width: 84, height: 84, color: clr),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Oops",
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    msg,
                    style: const TextStyle(
                        height: 1.5, fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      // ketika tidak setuju
                      if (onPressed != null)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: clr,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: clr, width: 2.5),
                              ),
                            ),
                            child: const Text(
                              'OKEY',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      if (onPressed != null) const SizedBox(width: 20),

                      // ketika setuju
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: clr,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            teks ?? 'OKEY',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
