import 'package:flutter/material.dart';

// class CustomPasswordTextFormField extends StatelessWidget {
//   TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.text,
//       validator: _validatePassword,
//       obscureText: !isPasswordVisible,
//       decoration: InputDecoration(
//           labelText: 'Password',
//           suffixIcon: IconButton(
//             icon: Icon(
//                 isPasswordVisible ? Icons.visibility : Icons.visibility_off),
//             onPressed: () {
//               setState(() {
//                 isPasswordVisible = !isPasswordVisible;
//               });
//             },
//           ),
//           icon: Icon(Icons.vpn_key)),
//     );
//   }
// }

label(String title) => Text(title);

InputDecoration buildInputDecoration({String hintText, IconData icon}) {
  return InputDecoration(
    prefixIcon: icon != null
        ? Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0))
        : null,
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

// InputDecoration buildInputDecoration2({String hintText, IconData icon}) {
//   return InputDecoration(
//     prefixIcon: icon != null
//         ? Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0))
//         : null,
//     hintText: hintText,
//     contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
//   );
// }

String validateEmail(String value) {
  String _msg;
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    _msg = "Your username is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Please provide a valid emal address";
  }
  // } else if (value != 'dummy@email.com') {
  //   _msg = "email not registered";
  // }
  return _msg;
}
