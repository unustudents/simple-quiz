import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Formulir {
  static TextFormField formReguler(
          {TextEditingController? ctr, required String title}) =>
      _form(
        l: title,
        c: ctr,
        i: Icons.person_2_rounded,
        k: TextInputType.emailAddress,
        v: (p0) {
          if (GetUtils.isNullOrBlank(p0) == true) {
            return 'Kolom wajib diisi';
          }
          return null;
        },
      );

  static TextFormField formToken({TextEditingController? ctr, String? title}) =>
      _form(
        l: title ?? 'Token',
        c: ctr,
        i: Icons.token_rounded,
        k: TextInputType.emailAddress,
        v: (p0) {
          if (GetUtils.isNullOrBlank(p0) == true) {
            return 'Kolom wajib diisi';
          }
          if (!GetUtils.isLengthGreaterOrEqual(p0, 8)) {
            return 'Masukan minimal 8 karakter';
          }
          return null;
        },
      );

  static TextFormField formEmail({TextEditingController? ctr}) => _form(
        l: 'Email',
        c: ctr,
        i: Icons.alternate_email_rounded,
        k: TextInputType.emailAddress,
        v: (p0) {
          if (GetUtils.isNullOrBlank(p0) == true) {
            return 'Kolom wajib diisi';
          }
          if (!GetUtils.isEmail(p0!)) {
            return 'Ini bukan email';
          }
          return null;
        },
      );

  static TextFormField formPass({
    TextEditingController? ctr,
    required bool visibil,
    required void Function()? onPres,
  }) =>
      _form(
        l: 'Password',
        c: ctr,
        i: Icons.lock_rounded,
        k: TextInputType.visiblePassword,
        s: IconButton(
            onPressed: onPres,
            icon: Icon(color: Colors.grey.shade500, Icons.visibility_rounded)),
        o: visibil,
        v: (p0) {
          if (GetUtils.isNullOrBlank(p0) == true) {
            return 'Kolom wajib diisi';
          }
          if (GetUtils.isLengthLessThan(p0, 6)) {
            return 'Minimal 6 karakter';
          }
          return null;
        },
      );

  static TextFormField _form({
    String? l,
    TextEditingController? c,
    IconData? i,
    TextInputType? k,
    Widget? s,
    bool o = false,
    String? Function(String?)? v,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: c,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        labelText: l,
        prefixIcon: Icon(i, color: Colors.grey.shade500),
        suffixIcon: s,
      ),
      obscureText: o,
      keyboardType: k,
      validator: v,
    );
  }
}
